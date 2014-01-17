" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.


set nocompatible
 "pathogen
execute pathogen#infect()
" call pathogen#incubate()
call pathogen#helptags()

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
 "runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

let mapleader=","
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


set number
set tabstop=4 expandtab shiftwidth=4 softtabstop=4
set pastetoggle=<F2>


if exists("+showtabline")
     function! MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . '|'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" turn on line numbering
"set nu

syntax on

filetype indent on
set autoindent
set hls

" map clear search highlight to backspace

nnoremap <Space> :noh<CR>

nnoremap k gk
nnoremap j gj
nnoremap $ g$


"set modeline
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim  

au Filetype markdown,md setlocal wrap linebreak nolist showbreak=...


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" from http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" #######

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set relativenumber

nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

au FocusLost * :wa

autocmd BufWritePost .vimrc source %
" #######


nnoremap <F5> :GundoToggle<CR>

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set scrolloff=1000
