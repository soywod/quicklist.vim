if exists('g:quicklist_loaded') | finish | endif
let g:quicklist_loaded = 1

" ------------------------------------------------------------------ # Loclist #

function! s:lc_empty()
  return empty(getloclist('.'))
endfunction

function! s:lc_open()
  if s:lc_empty() | call setloclist(0, []) | endif
  return filter(getwininfo(), 'v:val.loclist') == []
endfunction

function! s:toggle_lc()
  if s:lc_open() | lopen | else | lclose | endif
endfunction

" ----------------------------------------------------------------- # Quickfix #

function! s:qf_empty()
  return empty(getqflist())
endfunction

function! s:qf_open()
  return filter(getwininfo(), 'v:val.quickfix') == []
endfunction

function! s:toggle_qf()
  if s:qf_open() | copen | else | cclose | endif
endfunction

" -------------------------------------------------------------------- # Items #

function! s:next_item()
  if !s:lc_empty()
    silent! lnext
  elseif !s:qf_empty()
    silent! cnext
  endif
endfunction

function! s:prev_item()
  if !s:lc_empty()
    silent! lprevious
  elseif !s:qf_empty()
    silent! cprevious
  endif
endfunction

" ----------------------------------------------------------------- # Mappings #

let default_mappings = [
  \['<a-c>', 'toggle-qf'],
  \['<a-l>', 'toggle-lc'],
  \['<c-n>', 'next-item'],
  \['<c-p>', 'prev-item'],
\]

nnoremap <silent> <plug>(quicklist-toggle-qf) :call <sid>toggle_qf()<cr>
nnoremap <silent> <plug>(quicklist-toggle-lc) :call <sid>toggle_lc()<cr>
nnoremap <silent> <plug>(quicklist-next-item) :call <sid>next_item()<cr>
nnoremap <silent> <plug>(quicklist-prev-item) :call <sid>prev_item()<cr>

for [key, plug] in default_mappings
  let plug = printf('<plug>(quicklist-%s)', plug)
  if !hasmapto(plug, 'n') | exe printf('nmap %s %s', key, plug) | endif
endfor
