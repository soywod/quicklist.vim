# Quicklist.vim
A quickfix and loclist manager.

## Introduction

Quicklist reduces the amount of commands used to manage the quickfix, the
loclist and their items.

## Installation

```vim
Plug 'soywod/quicklist.vim'
```

## Mappings

Here the default mappings:

*Note: default mappings have been tested on US-like keyboard, consider
customize them if it doesn't work*<br />
*Note: the alt mapping may not work as expected on vim, consider customize
them*

```vim
nmap <a-l> <plug>(quicklist-toggle-lc) " Toggle the loclist
nmap <a-c> <plug>(quicklist-toggle-qf) " Toggle the quickfix
nmap <c-p> <plug>(quicklist-prev-item) " Select the previous loclist item (or the previous quickfix one if empty)
nmap <c-n> <plug>(quicklist-next-item) " Select the next loclist item (or the next quickfix one if empty)
```
