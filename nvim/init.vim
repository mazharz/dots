" ======================================================================
" Usability configuration
" ======================================================================

" set incompatible with vi
set nocompatible

" required
filetype off

" syntax
syntax on

" set mouse compatibility
set mouse=a

" encoding utf 8
set encoding=utf-8
set fileencoding=utf-8

" line number
set number relativenumber
"set number

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" ======================================================================
" Customization
" ======================================================================

" set leader to comma
let mapleader = ","

" search
" find next match as typing
set incsearch
" hilight searches
set hlsearch

" indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" tab replacement
set list
set listchars=tab:\|-
set nocp
set clipboard=unnamed
set clipboard=unnamedplus
set ignorecase

" automatic fold
:autocmd FileType python :set foldmethod=indent
:autocmd FileType javascript,html,css :set foldmethod=syntax

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" center cursor in file
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff+3<CR>

" <C-Space> for Vim's keyword autocomplete
"inoremap <Nul> <C-n>

" paste mode
set pastetoggle=<f9>

" select all with <leader>a
noremap <leader>A ggVG

" next file
noremap <leader>n :bn<CR>
" prev file
noremap <leader>N :bp<CR>

" maximize current window without closing the others (unlike <C-W><C-O>)
map <C-W><C-F> <C-W>_<C-W><Bar>

" shortcut for vimgrep
noremap [q :cprevious<CR>
noremap ]q :cnext<CR>
noremap [Q :cfirst<CR>
noremap ]Q :clast<CR>

" unhighlight search results using <Ctrl-l>
nnoremap <silent> <C-l> :nohl<CR><C-l>

" put a vertical line at column 80
set colorcolumn=80

" ======================================================================
" Plugin configuration
" ======================================================================
call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wesQ3/vim-windowswap'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'jiangmiao/auto-pairs'

call plug#end()

" coc extensions to install:
" coc-css coc-cssmodules coc-html coc-svg
" coc-eslint coc-json
" coc-python coc-sh coc-sql
" coc-pairs

" onedark theme
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
	set termguicolors
endif

" colorscheme
colorscheme onedark

" nerdtree
map <C-b> :NERDTreeToggle<CR>

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
nnoremap <C-M-p> :CtrlPBuffer<CR>

" conceal
set conceallevel=1
" and to toggle concealing use \l
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" prettier (must be installed via npm manually)
" FORMATTERS
" au FileType javascript setlocal formatprg=prettier\ --parser\ typescript
" au FileType javascript.jsx setlocal formatprg=prettier\ --parser\ typescript
" au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" au FileType html setlocal formatprg=js-beautify\ --type\ html
" au FileType scss setlocal formatprg=prettier\ --parser\ css
" au FileType css setlocal formatprg=prettier\ --parser\ css
" 
" noremap <leader>b mzgggqG`z


" nvim terminal configuration
nnoremap <leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>
" use alt+direction to navigate
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" provide path to node for coc
let g:coc_node_path = trim(system('which node'))

"""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""
" vim-bufkill
nnoremap <leader>d :BD<CR>

"""""""""""""""""""""""""""""""""""""""""""""
" indentLine
let g:indentLine_char = '│'
autocmd FileType help,nerdtree IndentLinesDisable " disable in help & nerdtree

"""""""""""""""""""""""""""""""""""""""""""""
" neoformat auto format on save
"autocmd BufWritePre "*.(js|jsx)" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
