" change default interface with [set]

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
"set signcolumn=yes:2
set number
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set confirm
set splitbelow
set autoindent
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start of the plugins

call plug#begin('~/.vim/plugged')
" insert the airline theme (the arrow bar interface)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" this way, use [gcc] to comment whole line at once
Plug 'tpope/vim-commentary'

" dracula theme for vim airline and vim
Plug 'dracula/vim', { 'as': 'dracula' }

" changes the default commentstring to be the same as the respective language
Plug 'jessarcher/vim-context-commentstring'

" adds other : commands in vim
" :Delete: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Delete, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Cfind: Run find and load the results into the quickfix list.
" :Clocate: Run locate and load the results into the quickfix list.
" :Lfind/:Llocate: Like above, but use the location list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo
Plug 'tpope/vim-eunuch'

" adds [cx] to exchange word, [cxx] to exchange line
Plug 'tommcdo/vim-exchange'

" adds git commands to vim by using :Git and the command
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb' 


" adds a fuzzy finder interface to the vim layout
"   - Only use it if vim 8.2 or above
"   - sudo add-apt-repository ppa:jonathonf/vim
"   - sudo apt update
"   - sudo apt install vim
"   - vim --version
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configs for vim airline
let g:airline#extensions#tabline#enabled = 1 "adds the buffer tabline
let g:airline#extensions#tabline#formatter = 'default' "adds the filename to the buffer when switching tabs
let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
set noshowmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configs for dracula theme
augroup DraculaOverrides
    autocmd!
    autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
    autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
    autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
    autocmd User PlugLoaded ++nested colorscheme dracula
augroup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configs for fxf plugin (line 72 - 74)
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

nmap <leader>f :Files<cr>
nmap <leader>F :AllFiles<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>h :History<cr>
nmap <leader>r :Rg<cr>
nmap <leader>R :Rg<space>
nmap <leader>gb :GBranches<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
