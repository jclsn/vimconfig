vim9script
# Scrollback pager for kitty. Instead of replaying the scrollback in a
# :terminal, the ANSI escapes are parsed into text properties, so every cell
# keeps exactly the colors and attributes kitty used. The palette is queried
# from kitty itself and the view and cursor are restored to kitty's screen.
#
# kitty.conf:
#   scrollback_pager vim -N --not-a-term -u ~/.vim/kitty_scrollback.vim -c "KittyScrollback INPUT_LINE_NUMBER CURSOR_LINE CURSOR_COLUMN" -
#
# -N is needed because Vim9 script restores 'cpoptions' after sourcing, which
# would otherwise leave Vim in compatible mode.

set encoding=utf-8

# Plugins (matchparen, anything in ~/.vim/plugin, ...) could only paint over
# kitty's colors, and all colors that matter come from kitty itself
set noloadplugins

set termguicolors
set background=dark

set nonumber
set norelativenumber
set noshowmode
# The command line row has no counterpart in kitty, use it to show where we are
set ruler
&rulerformat = '%30(%=%#KittyScrollbackLabel# SCROLLBACK %* %l/%L%)'
set noshowcmd
set laststatus=0
set showtabline=0
set signcolumn=no
set nolist
set nocursorline
set colorcolumn=
set nowrap
set scrolloff=0
set sidescrolloff=0
set virtualedit=all
set tabstop=8
set shortmess+=IF
&fillchars = 'eob: '

# Underline styles, underline color and strikethrough as kitty draws them
&t_Cs = "\e[4:3m"
&t_Ce = "\e[4:0m"
&t_Us = "\e[4:2m"
&t_ds = "\e[4:4m"
&t_Ds = "\e[4:5m"
&t_Ts = "\e[9m"
&t_Te = "\e[29m"
&t_8u = "\e[58:2::%lu:%lu:%lum"

nnoremap q <Cmd>quitall!<CR>
nnoremap i <Cmd>quitall!<CR>

const ATTR_BOLD = 1
const ATTR_DIM = 2
const ATTR_ITALIC = 4
const ATTR_REVERSE = 8
const ATTR_HIDDEN = 16
const ATTR_STRIKE = 32
# Colors are -1 (default), 0-255 (palette index) or RGB + TRUECOLOR
const TRUECOLOR = 0x1000000
# [fg, bg, underline color, attributes, underline style]
const DEFAULT_STYLE = [-1, -1, -1, 0, 0]
const UNDERLINES = ['', 'underline', 'underdouble', 'undercurl', 'underdotted', 'underdashed']

const CACHE_FILE = (empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME)
	.. '/kitty_scrollback_colors.json'

# Group name -> style, style key -> group name
var styles: dict<list<number>> = {}
var groups: dict<string> = {}
var used_indices: dict<bool> = {}

def XtermPalette(): list<string>
	var p = ['#000000', '#cd0000', '#00cd00', '#cdcd00', '#0000ee', '#cd00cd',
		'#00cdcd', '#e5e5e5', '#7f7f7f', '#ff0000', '#00ff00', '#ffff00',
		'#5c5cff', '#ff00ff', '#00ffff', '#ffffff']
	const steps = [0, 95, 135, 175, 215, 255]
	for i in range(216)
		p->add(printf('#%02x%02x%02x', steps[i / 36], steps[(i / 6) % 6], steps[i % 6]))
	endfor
	for i in range(24)
		p->add(printf('#%02x%02x%02x', 8 + 10 * i, 8 + 10 * i, 8 + 10 * i))
	endfor
	return p
enddef

def ReadDimOpacity(): number
	const dir = empty($KITTY_CONFIG_DIRECTORY) ? expand('~/.config/kitty') : $KITTY_CONFIG_DIRECTORY
	var opacity = 0.4
	try
		for line in readfile(dir .. '/kitty.conf')
			const m = matchlist(line, '^\s*dim_opacity\s\+\([0-9.]\+\)')
			if !empty(m)
				opacity = str2float(m[1])
			endif
		endfor
	catch
	endtry
	return float2nr(opacity * 1000)
enddef

var colors = {
	palette: XtermPalette(),
	fg: synIDattr(hlID('Normal'), 'fg#') ?? '#ffffff',
	bg: synIDattr(hlID('Normal'), 'bg#') ?? '#000000',
	selfg: '',
	selbg: synIDattr(hlID('Visual'), 'bg#'),
}
try
	colors->extend(json_decode(readfile(CACHE_FILE)->join()))
catch
endtry

const DIM_OPACITY = ReadDimOpacity()

var apply_timer = 0
var view: list<number> = []

def ResolveColor(c: number, default: string): string
	if c < 0
		return default
	elseif c < 256
		return colors.palette[c]
	endif
	return printf('#%06x', c - TRUECOLOR)
enddef

# Mix fg over bg the way kitty draws dim text
def Blend(fg: string, bg: string): string
	var out = '#'
	for i in [1, 3, 5]
		const f = str2nr(fg[i : i + 1], 16)
		const b = str2nr(bg[i : i + 1], 16)
		out ..= printf('%02x', (f * DIM_OPACITY + b * (1000 - DIM_OPACITY) + 500) / 1000)
	endfor
	return out
enddef

def DefineGroup(name: string)
	const st = styles[name]
	var fg = ResolveColor(st[0], colors.fg)
	var bg = st[1] < 0 ? 'NONE' : ResolveColor(st[1], colors.bg)
	if and(st[3], ATTR_REVERSE) != 0
		[fg, bg] = [bg == 'NONE' ? colors.bg : bg, fg]
	endif
	const cellbg = bg == 'NONE' ? colors.bg : bg
	if and(st[3], ATTR_HIDDEN) != 0
		fg = cellbg
	elseif and(st[3], ATTR_DIM) != 0
		fg = Blend(fg, cellbg)
	endif
	var attrs: list<string> = []
	if and(st[3], ATTR_BOLD) != 0
		attrs->add('bold')
	endif
	if and(st[3], ATTR_ITALIC) != 0
		attrs->add('italic')
	endif
	if and(st[3], ATTR_STRIKE) != 0
		attrs->add('strikethrough')
	endif
	if st[4] > 0
		attrs->add(UNDERLINES[st[4]])
	endif
	const sp = st[2] < 0 ? 'NONE' : ResolveColor(st[2], colors.fg)
	const gui = empty(attrs) ? 'NONE' : attrs->join(',')
	execute $'highlight {name} guifg={fg} guibg={bg} guisp={sp} gui={gui} cterm={gui}'
enddef

def ApplyColors()
	const bg = colors.bg
	const luma = 299 * str2nr(bg[1 : 2], 16) + 587 * str2nr(bg[3 : 4], 16) + 114 * str2nr(bg[5 : 6], 16)
	const background = luma > 127500 ? 'light' : 'dark'
	if &background != background
		# Reloads the colorscheme, so it has to come before the overrides
		&background = background
	endif
	execute $'highlight Normal guifg={colors.fg} guibg={colors.bg}'
	execute $'highlight EndOfBuffer guifg={colors.bg} guibg={colors.bg}'
	if !empty(colors.selbg)
		const selfg = colors.selfg ?? 'NONE'
		execute $'highlight Visual guifg={selfg} guibg={colors.selbg} gui=NONE cterm=NONE'
	endif
	highlight KittyScrollbackLabel guifg=#ffffff guibg=#7a5ccc gui=bold cterm=bold
	for name in keys(styles)
		DefineGroup(name)
	endfor
enddef

def ColorArg(params: list<list<string>>, i: number): list<number>
	# Returns [color, number of extra semicolon-separated parameters consumed]
	const p = params[i]
	var sub = copy(p)
	var consumed = 0
	if len(p) == 1
		# 38;5;n or 38;2;r;g;b
		sub = [p[0]] + params[i + 1 : i + 4]->mapnew((_, q) => q[0])
		consumed = get(sub, 1, '') == '5' ? 2 : 4
	elseif len(p) >= 6 && p[1] == '2'
		# 38:2:colorspace:r:g:b
		sub = [p[0], p[1]] + p[3 : 5]
	endif
	if get(sub, 1, '') == '5' && len(sub) >= 3
		const idx = str2nr(sub[2])
		if idx >= 16
			used_indices[idx] = true
		endif
		return [idx, consumed]
	elseif get(sub, 1, '') == '2' && len(sub) >= 5
		return [TRUECOLOR + str2nr(sub[2]) * 65536 + str2nr(sub[3]) * 256 + str2nr(sub[4]), consumed]
	endif
	return [-1, len(p) == 1 ? len(params) : 0]
enddef

def ApplySgr(sgr: string, st: list<number>)
	if sgr == '' || sgr == '0'
		st[0 : 4] = DEFAULT_STYLE
		return
	endif
	const params = stridx(sgr, ':') < 0
		? split(sgr, ';', true)->mapnew((_, v) => [v])
		: split(sgr, ';', true)->mapnew((_, v) => split(v, ':', true))
	var i = 0
	while i < len(params)
		const p = params[i]
		const code = str2nr(p[0])
		if code == 0
			st[0 : 4] = DEFAULT_STYLE
		elseif code == 1
			st[3] = or(st[3], ATTR_BOLD)
		elseif code == 2
			st[3] = or(st[3], ATTR_DIM)
		elseif code == 3
			st[3] = or(st[3], ATTR_ITALIC)
		elseif code == 4
			st[4] = len(p) > 1 ? min([str2nr(p[1]), 5]) : 1
		elseif code == 7
			st[3] = or(st[3], ATTR_REVERSE)
		elseif code == 8
			st[3] = or(st[3], ATTR_HIDDEN)
		elseif code == 9
			st[3] = or(st[3], ATTR_STRIKE)
		elseif code == 21
			st[4] = 2
		elseif code == 22
			st[3] = and(st[3], invert(ATTR_BOLD + ATTR_DIM))
		elseif code == 23
			st[3] = and(st[3], invert(ATTR_ITALIC))
		elseif code == 24
			st[4] = 0
		elseif code == 27
			st[3] = and(st[3], invert(ATTR_REVERSE))
		elseif code == 28
			st[3] = and(st[3], invert(ATTR_HIDDEN))
		elseif code == 29
			st[3] = and(st[3], invert(ATTR_STRIKE))
		elseif code >= 30 && code <= 37
			st[0] = code - 30
		elseif code >= 40 && code <= 47
			st[1] = code - 40
		elseif code >= 90 && code <= 97
			st[0] = code - 90 + 8
		elseif code >= 100 && code <= 107
			st[1] = code - 100 + 8
		elseif code == 39
			st[0] = -1
		elseif code == 49
			st[1] = -1
		elseif code == 59
			st[2] = -1
		elseif code == 38 || code == 48 || code == 58
			const [color, consumed] = ColorArg(params, i)
			st[code == 38 ? 0 : code == 48 ? 1 : 2] = color
			i += consumed
		endif
		i += 1
	endwhile
enddef

def GroupFor(st: list<number>): string
	if st == DEFAULT_STYLE
		return ''
	endif
	const key = st->join('_')
	if !groups->has_key(key)
		const name = 'KittySgr' .. len(groups)
		groups[key] = name
		styles[name] = copy(st)
		DefineGroup(name)
		prop_type_add(name, {highlight: name, combine: false})
	endif
	return groups[key]
enddef

# The same few SGR sequences repeat all over the scrollback, so remember which
# group each of them leads to from a given group
var transitions: dict<string> = {}

def NextGroup(group: string, sgr: string): string
	const key = group .. ' ' .. sgr
	if !transitions->has_key(key)
		var st = group == '' ? copy(DEFAULT_STYLE) : copy(styles[group])
		ApplySgr(sgr, st)
		transitions[key] = GroupFor(st)
	endif
	return transitions[key]
enddef

def AddProp(props: dict<list<list<number>>>, group: string, lnum: number, start: number, end: number)
	if group == '' || end <= start
		return
	endif
	if !props->has_key(group)
		props[group] = []
	endif
	props[group]->add([lnum, start, lnum, end])
enddef

# Strips the escape sequences from the buffer and turns the SGR state into
# text properties
def Render()
	var text: list<string> = []
	var props: dict<list<list<number>>> = {}
	var in_osc = false
	var lnum = 0
	var group = ''
	for line in getline(1, '$')
		lnum += 1
		if stridx(line, "\e") < 0
			AddProp(props, group, lnum, 1, len(line) + 1)
			text->add(line)
			continue
		endif
		var out = ''
		var start = 1
		var first = true
		for chunk in split(line, "\e", true)
			var plain: string
			if first
				# Text before the first escape, an OSC never spans lines
				plain = chunk
				first = false
				in_osc = false
			elseif in_osc && chunk[0] == '\\'
				# ST terminating the previous OSC
				plain = chunk[1 :]
				in_osc = false
			else
				in_osc = false
				if chunk[0] == '['
					# kitty only emits SGR, so try that before the generic CSI
					var end = stridx(chunk, 'm') + 1
					if end == 0 || chunk[1 : end - 2] !~ '^[0-9;:]*$'
						end = matchend(chunk, '^\[[0-?]*[ -/]*[@-~]')
					endif
					if end < 0
						plain = chunk[1 :]
					else
						if chunk[end - 1] == 'm'
							const new_group = NextGroup(group, chunk[1 : end - 2])
							if new_group != group
								AddProp(props, group, lnum, start, len(out) + 1)
								group = new_group
								start = len(out) + 1
							endif
						endif
						plain = chunk[end :]
					endif
				elseif chunk[0] == ']'
					# OSC (hyperlinks, shell integration marks, ...)
					const bel = stridx(chunk, "\x07")
					if bel >= 0
						plain = chunk[bel + 1 :]
					else
						plain = ''
						in_osc = true
					endif
				elseif chunk =~ '^[()*+#%]'
					plain = chunk[2 :]
				else
					plain = chunk[1 :]
				endif
			endif
			out ..= plain
		endfor
		AddProp(props, group, lnum, start, len(out) + 1)
		text->add(out)
	endfor

	setline(1, text)
	for [name, pos] in items(props)
		prop_add_list({type: name}, pos)
	endfor
	setlocal buftype=nofile bufhidden=hide noswapfile nomodified nomodifiable
enddef

# Puts kitty's first visible line at the top and the cursor on kitty's cursor
# cell. "input_line" is the buffer line of the first line on kitty's screen,
# "cursor_line" and "cursor_col" are 1-based screen coordinates, or 0 when the
# cursor was scrolled out of view.
def RestoreView(input_line: number, cursor_line: number, cursor_col: number)
	const last = line('$')
	const height = winheight(0)
	var top = max([1, min([input_line, last])])
	if cursor_line <= 0
		winrestview({topline: top, lnum: min([top + height - 1, last]), col: 0})
		return
	endif
	# The pager has the same size as kitty's screen, whose last row is the
	# buffer's last line. This also holds when kitty was scrolled back.
	const lnum = max([1, min([last - &lines + cursor_line, last])])
	# Vim needs a row for the command line; only scroll when the cursor would
	# otherwise end up there
	if lnum >= top + height
		top = lnum - height + 1
	endif
	winrestview({topline: top, lnum: lnum, col: 0})
	execute $'normal! {max([1, cursor_col])}|'
enddef

def QueryColors()
	var query = "\e]10;?\e\\\e]11;?\e\\\e]17;?\e\\\e]19;?\e\\"
	for i in range(16) + keys(used_indices)->mapnew((_, v) => str2nr(v))
		query ..= $"\e]4;{i};?\e\\"
	endfor
	echoraw(query)
enddef

def HexToByte(hex: string): number
	const max = float2nr(pow(16, len(hex))) - 1
	return (str2nr(hex, 16) * 255 + max / 2) / max
enddef

def OnOsc()
	const m = matchlist(v:termosc, '\]\(\d\+\);\%(\(\d\+\);\)\=rgb:\(\x\+\)/\(\x\+\)/\(\x\+\)')
	if empty(m)
		return
	endif
	const color = printf('#%02x%02x%02x', HexToByte(m[3]), HexToByte(m[4]), HexToByte(m[5]))
	const code = str2nr(m[1])
	if code == 4
		colors.palette[str2nr(m[2])] = color
	elseif code == 10
		colors.fg = color
	elseif code == 11
		colors.bg = color
	elseif code == 17
		colors.selbg = color
	elseif code == 19
		colors.selfg = color
	else
		return
	endif
	# Responses arrive one by one, apply them together
	timer_stop(apply_timer)
	apply_timer = timer_start(20, (_) => {
		ApplyColors()
		try
			mkdir(fnamemodify(CACHE_FILE, ':h'), 'p')
			writefile([json_encode(colors)], CACHE_FILE)
		catch
		endtry
		redraw!
	})
enddef

def OnEnter()
	if empty(view)
		return
	endif
	RestoreView(view[0], view[1], view[2])
	QueryColors()
	redraw!
enddef

def KittyScrollback(input_line: string, cursor_line: string, cursor_col: string)
	Render()
	ApplyColors()
	view = [str2nr(input_line), str2nr(cursor_line), str2nr(cursor_col)]
	if v:vim_did_enter
		OnEnter()
	endif
enddef

# Yanks go to kitty's clipboard through OSC 52, which needs nothing but kitty's
# write-clipboard permission
def CopyToKitty()
	if v:event.operator != 'y'
		return
	endif
	var text = v:event.regcontents
	if v:event.regtype == 'V'
		text += ['']
	endif
	echoraw($"\e]52;c;{base64_encode(str2blob(text))}\e\\")
enddef

autocmd VimEnter * ++once OnEnter()
autocmd TextYankPost * CopyToKitty()
autocmd TermResponseAll osc OnOsc()

command -bar -nargs=+ KittyScrollback KittyScrollback(<f-args>)
