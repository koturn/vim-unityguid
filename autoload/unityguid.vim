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
  let candidates = map(filter(s:globpath(a:dir, '**/*.meta'), 'filereadable(v:val)'), '{
        \ "guid": split(filter(readfile(v:val), "v:val =~# \"^guid:\"")[0], " ")[1],
        \ "path": fnamemodify(substitute(v:val, "\\.meta$", "", ""), ":.")
        \}')
  if type ==# 'file'
    return filter(candidates, 'filereadable(v:val.path)')
  elseif type ==# 'dir'
    return filter(candidates, 'isdirectory(v:val.path)')
  else
    return candidates
  endif
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
