let mapleader = ","

call pathogen#infect()
  set nocompatible
  set autoindent
  set backspace=2

  filetype plugin indent on

  set complete-=i

  set incsearch
  set hlsearch

  set joinspaces
  set laststatus=2      "Always show status line "
  set number            "Show line numbers"

  set scrolloff=5	"minimum number of lines above and below the cursor"
  set showcmd           "show partial cmd in status line"
  set showmatch         "Show matching brackets"
  set smartcase         "Case insensitive searches become sensitive with capitals
  set smarttab          "sw at the start of the line, sts everywhere else
  set expandtab
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set splitbelow        "Split windows at bottom"

  set statusline=[%n]\  
  set statusline+=%<%.99f\ 
  set statusline+=%h%w%m%r%
  set statusline+={exists('*CapsLockStatusLine')?CapsLockStatusLine():''}
  set statusline+=%y%
  set statusline+={exists('*rails#statusline')?rails#statusline():''}
  set statusline+=%{exists('*fugitive#statusline')?fugitive#statusline():''}
  set statusline+=*%=%-16(\ %l,%c-%v\ %)%P

  set tags+=../tags,../../tags,../../../tags, ../../../../tags
  set timeoutlen=1200  "A little bit more time for macros"
  set ttimeoutlen=50   "Make Esc work faster"

  set visualbell "Instead of beeping when doing something wrong"
  set virtualedit=block
  set wildmenu
  set wildmode=longest,list
  set wildignore=.git,pkginfo,includes,tmp
  set winaltkeys=no

  syntax on

  set backupdir=/tmp
  set directory=/tmp

  "case insensitive search"
  set ignorecase
  set smartcase

  "better line wrapping"
  set nowrap
  set textwidth=79
  set formatoptions=qrnl

  "Enable code folding"
  set nofoldenable

  "Insert auto complete options"
  set completeopt+=longest,menu,preview 

  setlocal numberwidth=5

  set title
  
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70


  let NERDTreeQuitOnOpen=1
  let NERDChristmasTree=1
  let NERDHighlightCursorLine=1
  let NERDTreeShowHidden=1

  silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"Strip all trailing whitespace in a file"
function! StripWhitespace ()
  exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

"Test runner"
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand(%), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTtest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file, ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "rspec"
  else 
    return "ruby"
  endif
endfunction

map <Leader>t :call RunCurrentTest()<CR>
inoremap jj <ESC>

set background=dark  
colorscheme jellybeans
set t_Co=256

" Powerline!
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

"Unbind cursors
inoremap <Up>    <NOP> 
inoremap <Down>  <NOP> 
inoremap <Left>  <NOP> 
inoremap <Right> <NOP> 
noremap <Up>     <NOP> 
noremap <Down>   <NOP> 
noremap <Left>   <NOP> 
noremap <Right>  <NOP>

