"============================================================================="
"  .                                                                          "
" ..: Philip Chang, Univ. of California San Diego, philip@physics.ucsd.edu    "
"                                                                             "
"============================================================================="

" Contents
" - Personal Settings

source $HOME/login/vim/a.vim
"source $HOME/login/vim/minibufexpl.vim
"source $HOME/login/vim/vim-geeknote-master/plugin/vim_geeknote.vim
"source $HOME/login/vim/taglist.vim
filetype plugin on

"==================="
" Personal Settings "
"==================="

"escape with jk
:imap jk <Esc>
syntax on                       "turning on syntax coloring
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cmdheight=2                 " Following lets me not having to Press ENTER like a dog
set ruler                       " Ruler to be shown on the bottom right corner
set hlsearch
"set wildmode=longest,list
set wildmenu
set number
" keep cursor in the middle
set scrolloff=999
" highlight current line
set cursorline
set nocursorcolumn
set nowrap
" tabs are replaced with chracters
set list
set listchars=tab:>-

" The command :dig displays other digraphs you can use.
hi CursorLine   cterm=NONE ctermbg=black guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>c :set cursorline! <CR>
nnoremap <Leader><Leader> :wqa!<CR>

"set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://
set ic
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set nocin noai nosi inde=
let thisos=$THISOS
if thisos == "Windows"
    set backspace=2
    set backspace=indent,eol,start
    set backupdir=~/.vim/backup//
    set directory=~/.vim/swap//
    set undodir=~/.vim/undo//
endif
autocmd BufNewFile,BufRead *.v e ++ff=dos | set tabstop=3 | set syntax=verilog
autocmd BufNewFile,BufRead *.vh e ++ff=dos | set tabstop=3 | set syntax=verilog
autocmd BufNewFile,BufRead *.vhd e ++ff=dos | set tabstop=3 | set syntax=verilog
autocmd BufNewFile,BufRead *.def set syntax=cfg
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"set formatoptions=

"set mouse=a                     "Set mouse active in iTerm (MacOSX?anyone?)
"set autoindent
"set smartindent
"set cursorline                  "Current cursorline option
"set textwidth=79                " break lines when line length increases

""======================="
"" trailing white spaces "
""======================="
"set list listchars=tab:>-,trail:.,extends:>
"" Enter the middle-dot by pressing Ctrl-k then .M
"set list listchars=tab:\|_,trail:·
"" Enter the right-angle-quote by pressing Ctrl-k then >>
"set list listchars=tab:»·,trail:·
"" Enter the Pilcrow mark by pressing Ctrl-k then PI
""set list listchars=tab:>-,eol:¶


"========="
" Mapping "
"========="

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>
nmap <leader>t8        :set tabstop=8<CR>
nmap <leader>t2        :set tabstop=2<CR>

" cxx <--> h
nmap <leader>d         :A<CR>

" Search
set incsearch       " shows matches halfway typing a pattern
set noignorecase          " (no)ignore case in searching
set hlsearch                " (no)highlight
nnoremap <silent> <Space> :silent noh<Bar>echo<CR> " Spacebar to clear search

" Setting a foldmethod to be initiated when I type \zs
nmap <leader>zs        :set foldmethod=syntax<CR>

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Commenting/uncommenting like CTRL-CC for emacs
map ,/ :s/^/\/\/<TAB>/<CR>  " c/c++ comment
map ,? :s/^\/\/<TAB>//<CR>  " c/c++ uncomment
map ,# :s/^/#<TAB>/<CR>     " shell comment
map ,3 :s/^#<TAB>//<CR>     " shell uncomment
map ,% :s/^/%<TAB>/<CR>     " latex comment
map ,5 :s/^%<TAB>//<CR>     " latex uncomment
map ," :s/^/"<TAB>/<CR>     " vimrc comment
map ,' :s/^"<TAB>//<CR>     " vimrc uncomment



"========="
" Buffers "
"========="

" It's useful to show the buffer number in the status line.
set laststatus=1 "statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Conveniently accessing buffers
"set wildchar=<Tab> wildmenu wildmode=full
"set wildcharm=<C-Z>
"nnoremap <F10> :b <C-Z>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>` :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
"nnoremap <Leader>d :bd<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>00 :10b<CR>
nnoremap <Leader>01 :11b<CR>
nnoremap <Leader>02 :12b<CR>
nnoremap <Leader>03 :13b<CR>
nnoremap <Leader>04 :14b<CR>
nnoremap <Leader>05 :15b<CR>
nnoremap <Leader>06 :16b<CR>
nnoremap <Leader>07 :17b<CR>
nnoremap <Leader>08 :18b<CR>
nnoremap <Leader>09 :19b<CR>

" " Save folds when closed, load folds when opened.
" "au BufWinLeave * silent! mkview
" "au BufWinEnter * silent! loadview
" "
" "
" Tab completion of words in the document
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"set term=builtin_ansi

"======================"
" Environment settings "
"======================"

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" When editing a file, always jump to the last cursor position
 au BufReadPost *
       \ if ! exists("g:leave_my_cursor_position_alone") |
       \     if line("'\"") > 0 && line ("'\"") <= line("$") |
       \         exe "normal g'\"" |
       \     endif |
       \ endif


if filereadable(".vim.custom")
  so .vim.custom
endif

"let g:SuperTabDefaultCompletionType = "<c-p>"

highlight Pmenu ctermbg=black ctermfg=white gui=bold
highlight PmenuSel ctermbg=white ctermfg=black gui=bold

" You need to use ctermbg ctermfg instead of guibg, guifg
" http://vim.1045645.n5.nabble.com/Fold-color-td2845368.html
highlight Folded ctermbg=none ctermfg=DarkGreen
highlight FoldColumn ctermbg=darkgrey ctermfg=white
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
"set foldmethod=syntax
"set foldlevel=20
"set foldnestmax=1
"set fdo-=search
let c_no_comment_fold = 1 "http://stackoverflow.com/questions/10038477/vim-syntax-folding-disable-folding-multi-line-comments
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" stop from fold opening when an unmatched paranthese is given
" http://stackoverflow.com/questions/4630892/vim-folds-open-up-when-giving-an-unmatched-opening-brace-parenthesis
"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Do not create swap file for dropbox
"autocmd BufNewFile,BufRead *
"  \ if expand('%:p') =~ '/home/phchang/phchang/Dropbox' |
"  \   set noswapfile |
"  \ else |
"  \   set swapfile |
"  \ endif

" custom highlighting
highlight MyRed ctermfg=red
syntax match MyRed /ERROR/
syntax match MyRed /Error/
syntax match MyRed /error/
highlight MyYellow ctermfg=yellow
syntax match MyYellow /WARNING/
syntax match MyYellow /Warning/
syntax match MyYellow /warning/

" diff setting
highlight DiffAdd    cterm=none ctermbg=DarkGray
highlight DiffDelete cterm=none ctermbg=Black
highlight DiffChange cterm=none ctermbg=Black
highlight DiffText   cterm=none ctermfg=yellow ctermbg=Black

let c_no_curly_error=1

"eof
