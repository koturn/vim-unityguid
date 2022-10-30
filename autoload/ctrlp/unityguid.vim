" ============================================================================
" FILE: unityguid.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" Last Modified: 2022-10-30
" DESCRIPTION: {{{
" Fuzzy finder by GUID of Unity.
" ctrlp.vim: https://github.com/ctrlpvim/ctrlp.vim
" }}}
" ============================================================================
if get(g:, 'loaded_ctrlp_unityguid', 0)
  finish
endif
let g:loaded_ctrlp_unityguid = 1
let s:save_cpo = &cpo
set cpo&vim

let s:ctrlp_builtins = ctrlp#getvar('g:ctrlp_builtins')


function! s:get_sid_prefix() abort " {{{
  return matchstr(expand('<sfile>'), '\zs<SNR>\d\+_\zeget_sid_prefix$')
endfunction " }}}
let s:sid_prefix = s:get_sid_prefix()
delfunction s:get_sid_prefix

" {{{ g:ctrlp_ext_vars
let g:ctrlp_ext_vars = add(get(g:, 'ctrlp_ext_vars', []), {
      \ 'init': s:sid_prefix . 'init()',
      \ 'accept': s:sid_prefix . 'accept',
      \ 'lname': 'unityguid',
      \ 'sname': 'unityguid',
      \ 'type': 'line',
      \ 'nolim': 1
      \})
" }}}
let s:id = s:ctrlp_builtins + len(g:ctrlp_ext_vars)
unlet s:ctrlp_builtins s:sid_prefix

let s:mode_action_dict = {
      \ 'e': 'edit',
      \ 'h': 'split',
      \ 't': 'tabedit',
      \ 'v': 'vsplit'
      \}


function! ctrlp#unityguid#id() abort " {{{
  return s:id
endfunction " }}}


function! ctrlp#unityguid#start(...) abort " {{{
  let s:type = expand(a:0 > 0 ? a:1 : '')
  let s:dir = expand(a:0 > 1 ? a:2 : getcwd())
  if s:dir[-1 :] !=# '/'
    let s:dir .= '/'
  endif
  call ctrlp#init(s:id, {'dir': s:dir})
endfunction " }}}


function! s:init() abort " {{{
  cal s:syntax()
  return map(unityguid#gather_candidates(s:dir, s:type), 'v:val.guid . "\t" . v:val.path')
endfunction " }}}

function! s:accept(mode, str) abort " {{{
  call ctrlp#exit()
  let action = get(s:mode_action_dict, a:mode, '')
  if action ==# ''
    return
  endif
  execute action split(a:str, "\t")[1]
endfunction " }}}

function! s:syntax() abort " {{{
  if ctrlp#nosy()
    return
  endif
  call ctrlp#hicheck('CtrlPUnityGuid', 'Comment')
  syntax match CtrlPUnityGuid '\zs\t.*$'
endfunction " }}}


let &cpo = s:save_cpo
unlet s:save_cpo
