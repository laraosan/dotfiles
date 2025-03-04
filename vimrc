set clipboard^=unnamed
set regexpengine=0
set number
set noswapfile
set nocompatible
syntax on
set termguicolors

const s:denops_src = '~/.cache/dpp/repos/github.com/denops/denops.vim'

execute 'set runtimepath+=' .. s:denops_src

const s:dpp_base = '~/.cache/dpp/'
const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:dpp_installer = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
const s:dpp_toml = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml'
const s:dpp_git = '~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git'

execute 'set runtimepath+=' .. s:dpp_src
execute 'set runtimepath+=' .. s:dpp_installer
execute 'set runtimepath+=' .. s:dpp_toml
execute 'set runtimepath+=' .. s:dpp_git

if s:dpp_base->dpp#min#load_state()
  autocmd User DenopsReady
  \ : echohl WarningMsg
  \ | echomsg 'dpp load_state() is failed'
  \ | echohl NONE
  \ | call dpp#make_state(s:dpp_base, '~/.config/vim/dpp.ts')
endif

autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

