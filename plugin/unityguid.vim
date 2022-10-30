" ============================================================================
" FILE: unityguid.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" Last Modified: 2022-10-30
" DESCRIPTION: {{{
" Fuzzy finder by GUID of Unity.
" }}}
" ============================================================================
if exists('g:loaded_unityguid')
  finish
endif
let g:loaded_unityguid = 1
let s:save_cpo = &cpo
set cpo&vim


command! -nargs=? -complete=dir CtrlPUnityGuid  call ctrlp#unityguid#start('', <f-args>)
command! -nargs=? -complete=dir CtrlPUnityGuidFile  call ctrlp#unityguid#start('file', <f-args>)
command! -nargs=? -complete=dir CtrlPUnityGuidDir  call ctrlp#unityguid#start('dir', <f-args>)


let &cpo = s:save_cpo
unlet s:save_cpo
