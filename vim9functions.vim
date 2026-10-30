vim9script

# Write JSON and pretty print it with jq if available. Do the rest in Vim, the
# shell commands for it differ between Linux and Windows
def WriteJson(file: string, data: dict<any>): bool
    if writefile([json_encode(data)], file) != 0
        return false
    endif
    if executable('jq')
        var formatted = systemlist('jq --indent 2 . ' .. shellescape(file))
        if v:shell_error == 0
            writefile(formatted, file)
        endif
    endif
    return true
enddef

def MoveCocWordsToCSpell()
    var coc_json = expand("$VIMHOME/coc-settings.json")
    var cspell_json = expand("$VIMHOME/cSpell.json")

    var coc: dict<any>
    try
        coc = json_decode(join(readfile(coc_json), "\n"))
    catch
        echohl ErrorMsg | echom "Could not parse " .. coc_json | echohl None
        return
    endtry

    # Extract words from coc-settings.json
    var words: list<string> = get(coc, 'cSpell.userWords', get(coc, 'userWords', []))
    if empty(words)
        echohl WarningMsg | echom "No words found in cSpell.userWords." | echohl None
        return
    endif

    # Merge words into cSpell.json
    var cspell: dict<any> = filereadable(cspell_json)
        ? json_decode(join(readfile(cspell_json), "\n"))
        : {words: []}
    cspell.words = sort(get(cspell, 'words', []) + words)->uniq()

    if !WriteJson(cspell_json, cspell)
        echohl ErrorMsg | echom "Failed to update cSpell.json" | echohl None
        return
    endif

    # Remove cSpell.userWords from coc-settings.json
    if has_key(coc, 'cSpell.userWords')
        remove(coc, 'cSpell.userWords')
    endif

    if WriteJson(coc_json, coc)
        echom "Moved words to cSpell.json and cleaned coc-settings.json!"
    else
        echohl ErrorMsg | echom "Error cleaning coc-settings.json" | echohl None
    endif
enddef

command! MoveWords call MoveCocWordsToCSpell()

def AddWordToCSpell(file: string)
    var word = expand('<cword>')
    if word == ''
        echo 'No word under cursor.'
        return
    endif

    if !filereadable(file)
        echo 'File not found: ' .. file
        return
    endif

    # Read file and parse JSON
    var json_text = join(readfile(file), "\n")
    var data = json_decode(json_text)

    # Helper: append if not present
    def AddUnique(dict: dict<any>, key: string, item: string)
        var list = get(dict, key, [])
        if index(list, item) < 0
            dict[key] = add(list, item)
        endif
    enddef

    AddUnique(data, 'words', word)
    AddUnique(data, 'userWords', word)

    WriteJson(file, data)

    echo 'Added "' .. word .. '" to cSpell dictionary.'
enddef

command! -nargs=0 CSpellAddWord call AddWordToCSpell(expand('$VIMHOME/cSpell.json'))

