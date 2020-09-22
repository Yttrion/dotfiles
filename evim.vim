"            _______          _________ _______
"           (  ____ \|\     /|\__   __/(       )
"           | (    \/| )   ( |   ) (   | () () |
"           | (__    | |   | |   | |   | || || |
"           |  __)   ( (   ) )   | |   | |(_)| |
"           | (       \ \_/ /    | |   | |   | |
"           | (____/\  \   /  ___) (___| )   ( |
"           (_______/   \_/   \_______/|/     \|


call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/vim-which-key'
Plug 'majutsushi/tagbar'
Plug 'psliwka/vim-smoothie'
Plug 'zeekay/vim-beautify'
Plug 'preservim/nerdcommenter'
Plug 'thaerkh/vim-workspace'
call plug#end()



colorscheme onehalflight
set background=dark



syntax on
filetype plugin indent on
set wildmenu
set smartindent
set smarttab
set autoindent
set autoread
set splitright
set splitbelow
set noswapfile
set expandtab
set showmode
set hlsearch
set nu 
set guioptions+=m
set mouse=a
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set timeoutlen=250
set clipboard=unnamedplus
set shortmess+=c
set updatetime=10



let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_always = 1
let g:tex_flavor='latex'
let g:livepreview_previewer = 'mupdf'
let g:livepreview_cursorhold_recompile = 0
let g:vimtex_compiler_progname = 'nvr'
let g:airline_powerline_fonts = 1
let g:airline_theme='onehalfdark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=23
let g:term_buf = 0
let g:term_win = 0
let g:vert_layout = 1



let mapleader=" "
map <C-l> :LLPStartPreview<CR>
nnoremap <silent><leader> :WhichKey '<Space>'<CR>
map <silent><space>fs       :w<CR>
map <silent><space>fq       :wq<CR>
map <silent><space>fas      :wa<CR>
map <silent><space>ffs      :source %<CR>
map <silent><space>ffq      :qa!<CR>
map <silent><space>fl       :find 
map <silent><space>bn       :bnext<CR>
map <silent><space>bp       :bprev<CR>
map <silent><space>bsv      :vsp<CR>
map <silent><space>bsh      :sp<CR>
map <silent><space>bq       :q<CR>
map <silent><space>be       :enew<CR>
map <silent><space>bc       :<C-u>up<bar>%bd<bar>e#<CR>
map <silent><space>tf       /
map <silent><space>tr       :%s/
map <silent><space>tln      :set invnumber<CR>
map <silent><space>tw       :set wrap!<CR>
map <silent><space>tb       :Beautify<CR>
map <silent><space>tc       :call NERDComment(0,"toggle")<CR>
map <silent><space>h        :wincmd h<CR>
map <silent><space>j        :wincmd j<CR>
map <silent><space>k        :wincmd k<CR>
map <silent><space>l        :wincmd l<CR>
map <silent><space>wth       <C-w>H<CR>
map <silent><space>wtv       <C-w>K<CR>
map <silent><space>pi       :PlugInstall<CR>
map <silent><space>pc       :PlugClean<CR>
map <silent><space>pu       :PlugUpdate<CR>
map <silent><space>ppu      :PlugUpgrade<CR>
map <silent><space>pru      :UpdateRemotePlugins<CR>
map <silent><space>n        :NERDTreeToggle<CR>
map <silent><space>ho       :noh<CR>
map <silent><space>cu       :CocUpdate<CR>
map <silent><space>csu      :CocUpdateSync<CR>
map <silent><space>cr       :CocRestart<CR>
map <silent><space>lw       :ToggleWorkspace<CR>
map <silent><space>ce       :hi Error NONE<CR>
map <silent><space>tag      :TagbarToggle<CR>
map <silent><space>ct       :ColorToggle<CR>
map <silent><space>q        :qa<CR>
"map <silent><space>
"map <silent><space>



if has('nvim')
    map <silent><space>ù    :call TermToggle(8)<CR>
else
    map <silent><space>ù    :terminal++rows=12<CR>    
endif
if has('python3')
    set pyx=3
elseif has ('python')
    set pyx=2
endif



function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        "startinsert!
        let g:term_win = win_getid()
    endif
endfunction
function! LayoutToggle()
    if g:vert_layout == 1
        "call <C-w>K<CR>
        :exe "normal \<C-w>K<CR>"
        let g:vert_layout = 0
    else
        "call <C-w>H<CR>
        :exe "normal \<C-w>H<CR>"
        let g:vert_layout = 1
    endif
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd CursorHold * silent call CocActionAsync('highlight')



let g:which_key_map = {'name' : '+Mastervim'}
let g:which_key_map.b = {
            \ 'name' : '+Buffer' ,
            \ 'n' : 'Next buffer' ,
            \ 'p' : 'Previous buffer' ,
            \ 's' : {
                \ 'name' : '+split' ,
                \ 'h' : 'Split buffer horizontally' ,
                \ 'v' : 'Split buffer vertically' ,
                \ } ,
            \ 'q' : 'Close buffer' ,
            \ 'e' : 'New empty buffer' ,
            \ 'c' : 'Close all buffers except the current one' ,
            \ }
let g:which_key_map.c = {
            \ 'name' : '+CoC-Nvim' ,
            \ 'u' : 'Update' ,
            \ 'su' : 'Update sync' ,
            \ 'r' : 'Restart' ,
            \ }
let g:which_key_map.f = {
            \ 'name' : '+File',
            \ 's' : 'Save' ,
            \ 'q' : 'Quit' ,
            \ 'a' : 'Save all' ,
            \ 'l' : 'Find file' ,
            \ 'e' : 'Open NERDTree',
            \ 'f' : {
                \ 'name' : '+more',
                \ 's' : 'Source the current file' ,
                \ 'q' : 'Close all opened files' ,
                \ },
            \ }
let g:which_key_map.m = {
            \ 'name' : '+Misc' ,
            \ 'e' : 'Clear errors' ,
            \ 'w' : 'Toggle workspaces' ,
            \ 'h' : 'Disable highlighting' ,
            \ 't' : 'Toggle Tagbar' ,
            \ 'q' : 'Quit all' ,
            \ }
let g:which_key_map.p = {
            \ 'name' : '+Plugin' ,
            \ 'c' : 'Clean plugins' ,
            \ 'i' : 'Install plugins' ,
            \ 'u' : 'Update plugins' ,
            \ 'p' : 'Update plugin manager' ,
            \ 'r' : 'Update remote plugins' ,
            \ }
let g:which_key_map.t = {
            \ 'name' : '+Text',
            \ 'f' : 'Find string' ,
            \ 'r' : 'Replace string' ,
            \ 'w' : 'Toggle word wrap' ,
            \ 'n' : 'Toggle line number' ,
            \ 'b' : 'Format text' ,
            \ 'c' : 'Toggle comment' ,
            \ }
let g:which_key_map.w = {
            \ 'name' : '+Window',
            \ 'h' : 'Focus left' ,
            \ 'j' : 'Focus down' ,
            \ 'k' : 'Focus up' ,
            \ 'l' : 'Focus right' ,
            \ 'ù' : 'Open terminal' ,
            \ 't' : {
                \ 'name' : 'Toggle' ,
                \ 'h' : 'Toggle horizontal layout' ,
                \ 'v' : 'Toggle vertical layout' ,
                \ },
            \}
