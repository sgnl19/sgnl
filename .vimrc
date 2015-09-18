" General options, see :help
set nocompatible
set ttybuiltin
set fileencodings=
"set autochdir
autocmd BufEnter * lcd %:p:h
set autoindent
set background=dark
set backspace=indent,eol,start
set fileencoding=utf-8
set helplang=de
set hlsearch
set showmatch
set ruler
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set nocindent
set nocursorcolumn
set nocursorline
"set nomodeline
set number
set nospell
set noswapfile
set wrap
set linebreak
set tags+=tags;/
set noexpandtab
set paste

" Remove all spaces at the end of any line
function! TRIM_SPACES()
	let line = line(".")
	let col = col(".")
	exec "%s/\\s*$//g"
	call cursor(line, col)
endfunc

function! SUPRESS_TABS()
	set expandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
endfunc

" Syntax highlighting without an external script
function! COLORIZE()
    syntax off
    syntax reset
    syntax clear
    syntax on
    hi clear
    hi LineNr NONE term=bold ctermfg=Yellow
    hi Comment NONE term=bold ctermfg=DarkCyan
    hi Constant NONE term=bold ctermfg=Magenta
    hi Special NONE term=bold ctermfg=DarkMagenta
    hi Identifier NONE term=bold cterm=bold ctermfg=Cyan
    hi Statement NONE term=bold ctermfg=Yellow
    hi Keyword NONE term=bold ctermfg=Yellow
    hi PreProc NONE term=bold ctermfg=LightBlue
    hi Type NONE term=bold ctermfg=LightGreen
    hi Function NONE term=bold cterm=bold
    hi Repeat NONE term=bold ctermfg=Yellow
    hi Operator NONE ctermfg=Red
    hi Ignore NONE ctermfg=Black
    hi Error NONE term=reverse ctermbg=Red ctermfg=White
    hi Todo ctermfg=LightRed ctermbg=none
    hi DiffAdd NONE
    hi DiffDelete NONE
    hi DiffText NONE
    hi DiffChange NONE cterm=undercurl
    hi link String Constant
    hi link Character Constant
    hi link Number Constant
    hi link Boolean Constant
    hi link Float Number
    hi link Conditional Repeat
    hi link Label Statement
    hi link Exception Statement
    hi link Include PreProc
    hi link Define PreProc
    hi link Macro PreProc
    hi link PreCondit PreProc
    hi link StorageClass Type
    hi link Structure Type
    hi link Typedef Type
    hi link Tag Special
    hi link SpecialChar Special
    hi link Delimiter Special
    hi link SpecialComment Special
    hi link Debug Special
endfunc

au BufWritePre *.sh,*.ksh,*.bash,*.csh          call TRIM_SPACES()
au BufWritePre *.h,*.hpp,*.hxx,*.c,*.cpp,*.cxx  call TRIM_SPACES()
au BufWritePre *.pl,*.pm,*.py,*.rb,*.php*       call TRIM_SPACES()
au BufWritePre *.htm*,*.tpl,*.txt,*.md          call TRIM_SPACES()
au BufWritePre *.xml,*.xsd,*.wsdl,*.dbk         call TRIM_SPACES()
au BufWritePre *.cmake,*akefile                 call TRIM_SPACES()
au BufWritePre *.vim*                           call TRIM_SPACES()

au! BufWritePost .vimrc source %

au BufReadPre *.sls call SUPRESS_TABS()
au BufNewFile *.sls call SUPRESS_TABS()

" Suffix <=> filetype mapping 
au BufNewFile *.*sh,.profile,.*shrc		set filetype=sh			number
au BufReadPre *.*sh,.profile,.*shrc		set filetype=sh			number
au BufNewFile *.h,*.cpp					set filetype=cpp		number
au BufReadPre *.h,*.cpp					set filetype=cpp		number
au BufNewFile *.pl,*.pm					set filetype=perl		number
au BufReadPre *.pl,*.pm					set filetype=perl		number
au BufNewFile *.py						set filetype=python		number
au BufReadPre *.py						set filetype=python		number
au BufNewFile *.php*					set filetype=php		number
au BufReadPre *.php*					set filetype=php		number
au BufNewFile *.*sql					set filetype=sql		number
au BufReadPre *.*sql					set filetype=sql		number
au BufNewFile *.htm,*.*html,*.tpl		set filetype=html		number
au BufReadPre *.htm,*.*html,*.tpl		set filetype=html		number
au BufReadPre .vimrc					set filetype=vim		number

" Suffixes that trigger syntax highlighting
au BufNewFile *.*sh,.profile,.*shrc		call COLORIZE()
au BufReadPre *.*sh,.profile,.*shrc		call COLORIZE()
au BufNewFile *.h,*.cpp					call COLORIZE()
au BufReadPre *.h,*.cpp					call COLORIZE()
au BufNewFile *.pl,*.pm					call COLORIZE()
au BufReadPre *.pl,*.pm					call COLORIZE()
au BufNewFile *.py						call COLORIZE()
au BufReadPre *.py						call COLORIZE()
au BufNewFile *.php*					call COLORIZE()
au BufReadPre *.php*					call COLORIZE()
au BufNewFile *.*sql					call COLORIZE()
au BufReadPre *.*sql					call COLORIZE()
au BufNewFile *.htm,*.*html,*.tpl		call COLORIZE()
au BufReadPre *.htm,*.*html,*.tpl		call COLORIZE()
au BufReadPre .vimrc					call COLORIZE()

au BufNewFile *.xml,*.dtd,*.xsd,*.wsdl,*.xsl*	set filetype=xml number
au BufReadPre *.xml,*.dtd,*.xsd,*.wsdl,*.xsl*	set filetype=xml number

au BufNewFile *.xml,*.dtd,*.xsd,*.wsdl,*.xsl*	call COLORIZE()
au BufReadPre *.xml,*.dtd,*.xsd,*.wsdl,*.xsl*	call COLORIZE()

" Update current setup when .vimrc is written
au! BufWritePost .vimrc source %
au! BufWritePost .vimrc call COLORIZE()

call COLORIZE()

" Key-remaps for old-fashioned and some remote ttys
"map! OH <ESC>0i
"map  OH <ESC>0
"map! OF <ESC>A
"map  OF <ESC>$
"map! [3~ <DEL>
"map  [3~ <DEL>


