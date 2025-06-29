vim9script

def MoveCocWordsToCSpell()
    var coc_json = expand("$MYVIMDIR/coc-settings.json")
    var cspell_json = expand("$MYVIMDIR/cSpell.json")

    # Check if jq is installed
    if system('command -v jq') == ""
        echohl ErrorMsg | echom "jq not found. Please install jq first." | echohl None
        return
    endif

    # Extract words from coc-settings.json
    var words = systemlist('jq -r ".\"cSpell.userWords\"[]" ' .. shellescape(coc_json))

    if v:shell_error != 0 || empty(words)
        echohl WarningMsg | echom "No words found in cSpell.userWords or JSON syntax error." | echohl None
        return
    endif

    # Ensure cSpell.json exists
    if !filereadable(cspell_json)
        writefile(['{ "words": [] }'], cspell_json)
    endif

    # Merge words into cSpell.json
    var add_words_cmd = 'jq --indent 2 --argjson newWords ' .. shellescape(json_encode(words)) ..
        ' ''.words += $newWords | .words |= unique'' ' ..
        shellescape(cspell_json) .. ' > ' .. shellescape(cspell_json .. ".tmp") .. ' && mv ' ..
        shellescape(cspell_json .. ".tmp") .. ' ' .. shellescape(cspell_json)

    system(add_words_cmd)

    if v:shell_error != 0
        echohl ErrorMsg | echom "Failed to update cSpell.json" | echohl None
        return
    endif

    # Remove cSpell.userWords from coc-settings.json
    var remove_words_cmd = 'jq "del(.\"cSpell.userWords\")" ' ..
        shellescape(coc_json) .. ' > ' .. shellescape(coc_json .. ".tmp") .. ' && mv ' ..
        shellescape(coc_json .. ".tmp") .. ' ' .. shellescape(coc_json)

    system(remove_words_cmd)

    if v:shell_error == 0
        echom "Moved words to cSpell.json and cleaned coc-settings.json!"
    else
        echohl ErrorMsg | echom "Error cleaning coc-settings.json" | echohl None
    endif
enddef

command! MoveWords call MoveCocWordsToCSpell()
