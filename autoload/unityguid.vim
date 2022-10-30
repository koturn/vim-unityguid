" ============================================================================
" FILE: unityguid.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" Last Modified: 2022-10-30
" DESCRIPTION: {{{
" Fuzzy finder by GUID of Unity.
" }}}
" ============================================================================
let s:save_cpo = &cpo
set cpo&vim


function! unityguid#gather_candidates(dir, ...) abort " {{{
  let type = a:0 > 0 ? a:1 : ''
  let candidates = filter(map(filter(s:globpath(a:dir, '**/*.meta'), 'filereadable(v:val)'), '{
        \ "guid": s:read_guid(v:val),
        \ "path": fnamemodify(substitute(v:val, "\\.meta$", "", ""), ":.")
        \}'), "v:val.guid !=# ''")
  if type ==# 'file'
    return filter(candidates, 'filereadable(v:val.path)')
  elseif type ==# 'dir'
    return filter(candidates, 'isdirectory(v:val.path)')
  else
    return candidates
  endif
endfunction " }}}


function! s:read_guid(filepath) abort " {{{
  let guidlines = filter(readfile(a:filepath), "v:val =~# \"^guid:\"")
  return len(guidlines) == 0 ? '' : split(guidlines[0], " ")[1]
endfunction " }}}


if v:version > 704 || v:version == 704 && has('patch279')
  function! s:globpath(path, expr) abort " {{{
    return globpath(a:path, a:expr, 1, 1)
  endfunction " }}}
else
  function! s:globpath(path, expr) abort " {{{
    return split(globpath(a:path, a:expr, 1), "\n")
  endfunction " }}}
endif


let &cpo = s:save_cpo
unlet s:save_cpo
