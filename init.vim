set nu
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus


syntax enable
syntax on
"colorscheme sublimemonokai
colorscheme monokai
set termguicolors

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

call plug#begin()
Plug 'ollykel/v-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/nvim-yarp'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

set guifont=Anonymice\ Nerd\ Font\ Mono\ 11


"NERDTREE SETTINGS
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ff0000
map <C-f> :NERDTreeToggle<CR>
"NERDTREE SETTINGS END

"Project-drawer
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" let g:airline#extensions#tabline#enabled = 1

"coc-extension-settings
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> mr <Plug>(coc-rename)

"nmap <c-m> 
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -std=c++17 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :py3f $HOME/.config/nvim/plugged/switchsourceheader.py<cr>
" autocmd filetype cpp nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>

nmap <silent> <C-p> :GFiles<CR>
nmap <silent> <C-t> :BTags<CR>

" Buffer previous / next
nmap <silent> <C-j> :bn<CR>
nmap <silent> <C-k> :bp<CR>

" Lightline settings
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
