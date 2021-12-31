"dein Scripts-----------------------------
if !&compatible
  set nocompatible               " Be iMproved
endif

au BufRead,BufNewFile *.tf set filetype=terraform

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let g:vimfiler_as_default_explorer = 1
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
	let s:toml = '~/.config/nvim/dein-plugins.toml'
	let s:toml_lazy = '~/.config/nvim/dein-lazy-plugins.toml'
	let s:toml_darwin = '~/.config/nvim/dein-darwin-plugins.toml'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_repo_dir)
  call dein#begin(s:dein_repo_dir)

	call dein#load_toml(s:toml, {'lazy' : 0})
	call dein#load_toml(s:toml_lazy, {'lazy' : 1})

  if system('uname') == "Darwin\n"
    call dein#load_toml(s:toml_darwin, {'lazy' : 0})
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()	" if found plugins which are not installed yet.
	call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

"End dein Scripts-------------------------

" Required:
filetype plugin indent on
syntax enable

set number			" dsiplay line number
set wrap
set encoding=utf-8		" specify encoding
set fileencoding=utf-8		" specify file encoding
set ambiwidth=double		" prevent garbled
set clipboard+=unnamed		" share clipboard with OS
set vb t_vb=			" unable beep sound
set novisualbell		" unable screen flash
set mouse=a			" enable using mouse
set nostartofline		" unable moving to line head automatically when you move to other line
set expandtab
set tabstop=2
set shiftwidth=2

" for syntax highlighter
syntax on			" us syntax highlight
syntax enable			" enable syntax highlight
set cursorline			" highlights a editing line
set hlsearch			" highlights search results
set showmatch			" hilights correspondence of parentheses
set matchpairs& matchpairs+=<:>
set list			" visualize invisible characters 
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"set menu window opacity
set pumblend=10 

" for use pyenv

" golang
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=2
autocmd FileType go setlocal shiftwidth=4

colorscheme iceberg
set background=dark
