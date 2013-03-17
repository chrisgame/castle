call pathogen#infect()
  set nocompatible
  syntax on
  
  colorscheme jellybeans

  filetype plugin indent on

  set incsearch

  set hlsearch

  set showmatch

  set smarttab

  set directory=/tmp/

  set scrolloff=3

  set number
  setlocal numberwidth=5

  set wildmenu
  set wildmode=list:longest,full

  set complete-=i

  set laststatus=2
  set statusline=\ 
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'},
  set statusline+=%{&fileformat}]
  set statusline+=%h%1*%m%r%w%0*
  set statusline+=%=
  set statusline+=%-14.(%1,%c%V%)\ %<%P
 
  set title
  
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  set backspace=indent,eol,start

  let NERDTreeQuitOnOpen=1
  let NERDChristmasTree=1
  let NERDHighlightCursorLine=1
  let NERDTreeShowHidden=1




