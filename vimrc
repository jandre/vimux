" Mephux <dustin.webber[at]gmail.com>
" ~/.VIMRC

set nocompatible                   " Must come first because it changes others
" set shell=/bin/sh
set encoding=utf-8

" Setup Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on         " Turn on file type detection.
syntax on                         " syntax highlighting

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2
set synmaxcol=2048                " Syntax coloring lines that are too
                                  " long just slows down the world

set viminfo='20,\"80              " read/write a .viminfo file, don't store more

set t_Co=256                      " 256 colors
set term=xterm

set background=dark
colorscheme epix

" match LongLineWarning '\%>80v.\+'
" match ErrorMsg '\%>80v.\+'

" au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter * let w:m2=matchadd('LongLineWarning', '\%>80v.\+', -1)

set autoread
set ttyfast                       " you have a fast terminal
set ttyscroll=3
set lazyredraw                    " avoid scrolling problems

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Windowing settings
" set equalalways                   " keep windows equal when splitting (default)
set winfixwidth
set eadirection=hor               " ver/hor/both - where does equalalways apply
set winwidth=85
set winheight=10
set winminheight=10
set winheight=999


set showcmd
set laststatus=2                  " Show the status line all the time

set autoindent                    " automatic indent new lines
set smartindent                   " be smart about it
set nowrap                        " do not wrap lines
set softtabstop=2                 " yep, two
set shiftwidth=2                  " ..
set tabstop=2
set expandtab                     " expand tabs to spaces
set nosmarttab                    " no tabs
set formatoptions=qrn1            " support for numbered/bullet lists
set virtualedit=block             " allow virtual edit in visual block mode

" Man page support
runtime ftplugin/man.vim

" Mark the ideal max text width
if exists('+colorcolumn')
  set colorcolumn=80
endif

set clipboard=unnamed

" Yank text to the OS X clipboard
map <leader>y "*y
map <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" On Focus Lost
" Enter normal mode
" au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_running")

  if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    " Zencoding Keymap - MacOSX
    let g:user_zen_expandabbr_key = '<D-e>'
  endif

else

  set selection=exclusive           " Select

  " Zencoding Keymap - Linux/Windows/Terminal
  let g:user_zen_expandabbr_key = '<C-e>'

  map <Leader>w <ESC>:w<CR>

  nmap <silent> <C-Left> b
  nmap <silent> <C-Right> w
  vmap <silent> <C-Left> b
  vmap <silent> <C-Right> w

  imap <silent> <C-Left> <ESC>b
  imap <silent> <C-Right> <ESC>w

  nmap <silent> <C-h> b
  nmap <silent> <C-l> w
  vmap <silent> <C-h> b
  vmap <silent> <C-l> w

  nmap <silent> <C-j> }
  nmap <silent> <C-k> {
  vmap <silent> <C-j> {
  vmap <silent> <C-k> }

  nmap <silent> <C-Up> {
  nmap <silent> <C-Down> }
  vmap <silent> <C-Up> {
  vmap <silent> <C-Down> }

  imap <silent> <C-Up> <ESC> {
  imap <silent> <C-Down> <ESC>}

endif


" Nav Hacks
map <C-c> <plug>NERDCommenterToggle<CR>

set foldmethod=indent             " Folding settings
set foldnestmax=3                 " deepest fold is 3 levels
set nofoldenable                  " dont fold by default
set showmode                      " Display the mode you're in.
set modelines=0
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set wildmenu                      " Enhanced command line completion.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains
                                  " a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" set wrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

" Terminal settings
set vb t_vb=		                  " shut off bell entirely; see also .gvimrc
set title                         " Set the terminal's title
set visualbell                    " No beeping.

set undofile
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Hide the mouse pointer while typing
set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" CtrlP configuration
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*   " for Linux/MacOSX
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.DS_Store$\|.swp$'

" :Extradite - Git log viewer
map <Leader>o :Extradite!<CR>

" Awk
nnoremap <leader>f :Ack<Space>

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Keep swap files in one location
" +=,$HOME/.vim/tmp/
set directory=$HOME/.vim/tmp/,.

" Hide the mouse pointer while typing
set mousehide

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" :Extradite - Git log viewer
map <Leader>o :Extradite!<CR>

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" SnipMate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['handlebars'] = 'html'

" Quickly edit/reload the vimrc file
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ac :tabedit ~/.vim/autocorrect.vim<CR>
source ~/.vim/autocorrect.vim
nmap <silent> <leader>ss :tabedit ~/.vim/bundle/snipmate-snippets/snippets/_.snippets<CR>

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Node/EJS
au BufRead,BufNewFile *.ejs set ft=html

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Bubble multiple lines
" vmap <C-Down> ]egv
" vmap <C-Up> [egv



" Tagbar
" map <Leader>t <ESC>:TagbarToggle<cr>

" Nerdtree settings
map <Leader>t :NERDTreeToggle<Enter>
let g:NERDTreeMouseMode = 2
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize = 30
let NERDTreeHighlightCursorline=1
" nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0

" BuffergatorToggle
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_suppress_keymaps = 1
let g:buffergator_split_size = 20
map <leader>b :BuffergatorToggle<Enter>

call SingleCompile#ChooseCompiler('c', 'cc')
nmap <Leader>B :SCCompile<cr>
nmap <Leader>r :update<CR>:SCCompileRun<cr>
vmap <Leader>r :update<CR>:SCCompileRun<cr>
imap <Leader>r <Esc>:SCCompileRun<cr>

" vim-pasta
let g:pasta_disabled_filetypes = ['yaml']
" let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']

" Force Save
cmap w!! w !sudo tee % >/dev/null

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd filetype svn,*commit* setlocal spell
autocmd FileType c set sw=4 sts=4 et


" Smartusline
let g:smartusline_string_to_highlight = '%f'
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=58 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'

" Status Line Setup
set statusline=[%n]\ %<%f\ %h%w%m%r%y

" Git branch and status
set statusline+=\ %{fugitive#statusline()}

" Display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" Column/Line Information
set statusline+=%=%-10(\ %l,%c-%v\ %)
set statusline+=\ %P "percent through file

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Highlight the current line and column Don't do this - It makes window
" redraws painfully slow
set nocursorline
set nocursorcolumn

" Remove Ex mode Replace with a format helper
nnoremap Q gqip

augroup ft_javascript
    au!

au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}
augroup END

" Command-/ to toggle comments
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
map <Leader>c <plug>NERDCommenterToggle<CR>

" QuickFix Navigation
" map <c-z> :cprevious<CR>
" map <c-x> :cnext<CR>

" Quickfix (open/close using <leader>f)
nmap <silent> <leader>f :QFix<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Use the damn hjkl keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" make p in Visual mode replace the selected text with the yank register
" vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Quick yanking to the end of the line
nmap Y ^y$

" Folding
nnoremap <Space> za
vnoremap <Space> za

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
nmap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yypVr=
nnoremap <leader>4 yypVr-
nnoremap <leader>5 yypVr^
nnoremap <leader>6 yypVr"

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 20m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 30m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 30m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" Git Stuff
nmap <leader>gs :Gstatus<CR><C-w>20+

" Ruby Debug
" let g:ruby_debugger_progname = 'mvim'
" map <Leader>B  :call g:RubyDebugger.toggle_breakpoint()<CR>
" map <Leader>V  :call g:RubyDebugger.open_variables()<CR>
" map <Leader>M  :call g:RubyDebugger.open_breakpoints()<CR>
" map <Leader>T  :call g:RubyDebugger.open_frames()<CR>
" map <Leader>S  :call g:RubyDebugger.step()<CR>
" map <Leader>F  :call g:RubyDebugger.finish()<CR>
" map <Leader>N  :call g:RubyDebugger.next()<CR>
" map <Leader>C  :call g:RubyDebugger.continue()<CR>
" map <Leader>E  :call g:RubyDebugger.exit()<CR>

" Control-F for Ack
map <C-F> :Ack<space>

" Control-m/n to increase/decrease indentation
vmap <C-m> >gv
vmap <C-n> <gv

" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" Show the MD5 of the current buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -range Md5 :echo system('echo '.shellescape(join(getline(<line1>, <line2>), '\n')) . '| md5')

