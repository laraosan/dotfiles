set number
set title
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set hidden

set noswapfile
set nobackup
set noundofile

set re=0

let mapleader = ' '

" buffer control
nnoremap <leader>> :bnext<cr>
nnoremap <leader>< :bprevious<cr>
nnoremap <leader>x :bdelete<cr>


call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

Plug 'lambdalisue/vim-fern'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'

Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'glidenote/memolist.vim'

call plug#end()


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-b> lsp#scroll(-4)

    " let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap <leader>ff :Fern . -reveal=%<cr>

nnoremap <leader>ft :FloatermToggle<cr>

autocmd BufWritePost * GitGutter

let g:memolist_path = '~/Documents/memolist'
nnoremap <leader>mn :MemoNew<cr>
nnoremap <leader>ml :MemoList<cr>
nnoremap <leader>mg :MemoGrep<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'base16_monokai'

set termguicolors
colorscheme monokai

