" -----------------   Author: Lei Duan
" -----------------    Email: lei_d@qq.com
" -----------------  WebSite: http://blog.satikey.com
" -----------------     Date: 2012-08-31 14:10


" Ctrl + H                   --光标移行首
" Ctrl + J                   --光标移下一行行首
" Ctrl + K                   --光标移上一行行尾
" Ctrl + L                   --光标移行尾
" Ctrl + Z                   --取代ESC模式键 [和部分软件的快捷键有冲突]
" Ctrl + S                   --保存文件
" Ctrl + C                   --编译 [支持C/C++、Java、Haskell]
" Ctrl + R                   --运行 [支持C/C++、Java、Haskell、Lua、Perl、Python、Ruby]
" Ctrl + ]                   --转到函数定义
" Ctrl + T                   --返回调用函数
" Ctrl + E                   --添加注释 [插入模式] [添加的是C语言的多行注释，所以适用于C/C++/Java等]
" Ctrl + E                   --一步加载语法模板和作者、时间信息 [非插入模式]

" <C-P>                      --单词补全
" <C-X><C-L>                 --整行补全
" Tab键                      --插入模式下的全功能语法结构补全 [snipMate插件]
" Shift + Insert             --向Vim中粘贴从别处复制的内容

" nt                         --打开NERDTree [非插入模式]
" tl                         --打开TagList [非插入模式]
" \ww                        --进入vimWiki模式 [非插入模式]

" za                         --打开或关闭当前折叠
" zM                         --关闭所有折叠
" zR                         --打开所有折叠

" :set syntax=cpp            --手动选择语法高亮 [或 :set filetype=cpp]

" :%!xxd                     --转储二进制文件，以十六进制形式显示
" :%!xxd -r                  --还原二进制文件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------
" => Deps
"------------------------------------------------

set nocompatible               " Get out of VI's compatible mode
let mapleader=','              " Change the mapleader
let g:mapleader=','              " Change the mapleader
let maplocalleader='\'         " Change the maplocalleader
set timeoutlen=500             " Time to wait for a command   
scriptencoding utf-8           "  设置这个脚本的编码

" 初始化一些文件夹
function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir'}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                silent call mkdir(directory)
                exec 'set '.settingname.'='.directory
            else
                echo "Warning: Unable to create directory: ".directory
                echo "Try: mkdir -p ".directory
            endif
        else
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()
"================================================================


" DISABLE: done in exQuickFix { 
" set quick fix error format
" default errorformat = %f(%l) : %t%*\D%n: %m,%*[^"]"%f"%*\D%l: %m,%f(%l) : %m,%*[^ ] %f %l: %m,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,%f|%l| %m
"set errorformat+=%D%\\d%\\+\>------\ %.%#Project:\ %f%\\,%.%# " msvc 2005 error-entering
"set errorformat+=%D%\\d%\\+\>------\ %.%#Project:\ %f%\\,%.%# " msvc 2005 error-entering
"set errorformat+=%X%\\d%\\+\>%.%#%\\d%\\+\ error(s)%.%#%\\d%\\+\ warning(s) " msvc 2005 error-leaving
set errorformat+=%\\d%\\+\>%f(%l)\ :\ %t%*\\D%n:\ %m " msvc 2005 error-format
"set errorformat+=%f(%l\\,%c):\ %m " fxc shader error-format
" } DISABLE end 


"blank      空白
"buffers    缓冲区
"curdir     当前目录
"folds      折叠
"help       帮助
"options    选项
"tabpages   选项卡
"winsize    窗口大小
"slash      转换文件路径中的\为/以使session文件兼容unix
"unix       设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
 
"-------------------------------------------------
" => General
"-------------------------------------------------
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set backspace=indent,eol,start  " Make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,]      "  Backspace and cursor keys wrap to
set virtualedit=block,onemore   " Allow for cursor beyond last character
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set sidescroll=1                " Minimal number of columns to scroll horizontally
set sidescrolloff=10            " Minimal number of screen columns to keep away from cursor
             

set shellredir=>%s\ 2>&1                     " Redefine the shell redirection operator to
                                             " receive both the stderr messages and stdout messages

set autoread                                 " Set autoread when a file is changed outside
set autowrite                                " automatically write a file when leaving a modified buffer
set history=1000    
set updatetime=1000
set backup                                   " Set backup
if has('persistent_undo')
    set undofile                            "so is persistent undo ...
    set undolevels=1000                     "maximum number of changes that can be undone
    set undoreload=10000                    "maximum number lines to save for undo on a buffer reload
endif

set shortmess=atl
set shortmess+=filmnrxoOtT                   " abbrev. of messages (avoids 'hit enter')
                                            
set viewoptions=folds,options,cursor,unix,slash  " better unix / windows compatibility
set virtualedit=onemore                      " allow for cursor beyond last character
                        
set clipboard+=unnamed                       " Yanks go on clipboard instead
set spell                                    " Spell checking on
set modeline                                 " Turn on modeline
set completeopt+=longest                     " Optimize auto complete
set completeopt-=preview                     " Optimize auto complete
 
set autochdir                                " 设定文件浏览器目录为当前目录
set nowrap                                   " 设置不自动换行
set foldmethod=syntax                        " 选择代码折叠类型
set foldlevel=100                            " 禁止自动折叠
"================================================================

"-------------------------------------------------
" => Formatting
"-------------------------------------------------
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set shiftround               " Indent/outdent to nearest tabstop
set expandtab                " Convert all tabs typed to spaces
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
set showmatch                " 显示括号配对情况
set matchtime=0              " 0 second to show the matching paren ( much faster )
set mousehide                " Hide mouse after chars typed
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音

set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Use powerful wildmenu

set formatoptions+=rnlmM     " Optimize format options
set hidden                   " 允许在有未保存的修改时切换缓冲区
set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
set linebreak                   " Wrap long lines at a blank
set showbreak=↪                " Change wrap line break
"showbreak=+++\ " (white space must be escaped)
"set fillchars=diff:⣿,vert:│    " Change fillchars
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
"================================================================

"-------------------------------------------------
" => Vim User Interface
"-------------------------------------------------

" Set title
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Set tabline
set showtabline=2 " Always show tab line
" Set up tab labels
set guitablabel=%m%N:%t\[%{tabpagewinnr(v:lnum)}\]
set tabline=%!MyTabLine()
function! MyTabLine()
    let s=''
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr('$') " From the first page
      let buflist=tabpagebuflist(i)
      let winnr=tabpagewinnr(i)
      let s.=(i==t?'%#TabLineSel#':'%#TabLine#')
      let s.='%'.i.'T'
      let s.=' '
      let bufnr=buflist[winnr - 1]
      let file=bufname(bufnr)
      let m=''
      if getbufvar(bufnr, "&modified")
          let m='[+]'
      endif
      if file=~'\/.'
          let file=substitute(file,'.*\/\ze.','','')
      endif
      if file==''
        let file='[No Name]'
      endif
      let s.=m
      let s.=i.':'
      let s.=file
      let s.='['.winnr.']'
      let s.=' '
      let i=i+1
    endwhile
    let s.='%T%#TabLineFill#%='
    let s.=(tabpagenr('$')>1?'%999XX':'X')
    return s
  endfunction
" Set up tab tooltips with every buffer name
set guitabtooltip=%F

" Set status line
"set laststatus=2             " 开启状态栏信息
set cmdheight=1              " 命令行的高度，默认为1，这里设为2
"if has('statusline')
	set laststatus=2 " Show the statusline
	" Broken down into easily includeable segments
	"set statusline=%<%f\    " Filename
	"set statusline+=%w%h%m%r " Options
	"set statusline+=%{fugitive#statusline()} "  Git Hotness
	"set statusline+=\ [%{&ff}/%Y]            " filetype
	"set statusline+=\ [%{getcwd()}]          " current dir
	"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  
  "set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
  
   set statusline=%t       "tail of the filename
   set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
   set statusline+=%{&ff}] "file format
   set statusline+=%h      "help file flag
   set statusline+=%m      "modified flag
   set statusline+=%r      "read only flag
   set statusline+=%y      "filetype
   set statusline+=%=      "left/right separator
   set statusline+=%c,     "cursor column
   set statusline+=%l/%L   "cursor line/total lines
   set statusline+=\ %P    "percent through file
"endif
" Set the style of the status line
" Use vim-powerline to modify the statuls line
if has('gui_running') && (has('win64') || has('win32'))
  "let g:Powerline_symbols='unicode'
  let g:Powerline_symbols = 'fancy'
endif
"================================================================
 
"-------------------------------------------------
" => GUI
"-------------------------------------------------

set background=dark  " Set background
colorscheme desert       " 着色模式：蓝色背景
" 字体 && 字号
set guifont=YaHei_Consolas_Hybrid:h11 

if !has('gui_running')
    set t_Co=256 " Use 256 colors
endif

"nnoremap <silent>\t :colorscheme Tomorrow-Night-Eighties<CR>
"nnoremap <silent>\j :colorscheme jellybeans<CR>
"nnoremap <silent>\h :colorscheme hybrid<CR>
"if has('gui_running')
"    nnoremap <silent>\t :colorscheme Tomorrow-Night<CR>
"    nnoremap <silent>\s :colorscheme solarized<CR>
"endif

if has("gui_running")
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    "set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T       " 隐藏工具栏
    set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif
" 高级用法
"if has("gui_running")
    " check and determine the gui font after GUIEnter. 
    " NOTE: getfontname function only works after GUIEnter.  
    "au GUIEnter * call s:SetGuiFont() 
"endif

"if has("gui_running")
"    set lines=40 columns=130
"endif

" set guifont
function s:SetGuiFont()
    if has("gui_gtk2")
        set guifont=Luxi\ Mono\ 13
    elseif has("x11")
        " Also for GTK 1
        set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("mac")
        if getfontname( "Bitstream_Vera_Sans_Mono" ) != ""
            set guifont=Bitstream\ Vera\ Sans\ Mono:h13
        elseif getfontname( "DejaVu\ Sans\ Mono" ) != ""
            set guifont=DejaVu\ Sans\ Mono:h13
        endif
    elseif has("gui_win32")
        let font_name = ""
        if getfontname( "Bitstream_Vera_Sans_Mono" ) != ""
            set guifont=Bitstream_Vera_Sans_Mono:h12:cANSI
            let font_name = "Bitstream_Vera_Sans_Mono" 
        elseif getfontname( "Consolas" ) != ""
            set guifont=Consolas:h12:cANSI " this is the default visual studio font
            let font_name = "Consolas" 
        else
            set guifont=Lucida_Console:h12:cANSI
            let font_name = "Lucida_Console" 
        endif
        silent exec "nnoremap <unique> <M-F1> :set guifont=".font_name.":h11:cANSI<CR>"
    endif
endfunction
"================================================================
 
"-------------------------------------------------
" => AutoCMD
"-------------------------------------------------
" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
"autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
"autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

autocmd BufWritePost .vimrc source $MYVIMRC  " Source the vimrc file after saving it
" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
auto InsertEnter * set nocursorline
auto InsertLeave * set cursorline
set cursorline               " 突出显示当前行
set cursorcolumn             " 突出显示当前列
"================================================================

"-------------------------------------------------
" => Code 
"-------------------------------------------------
" 设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
language messages zh_CN.utf-8 
"================================================================

"-------------------------------------------------
" => Platform Specific Configuration
"-------------------------------------------------

" On Windows, also use '.vim' instead of 'vimfiles'
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set fileformats=unix,mac,dos " Auto detect the file formats
"================================================================

"--------------------------------------------------
" => Plugin
"--------------------------------------------------
 
"------------------------------------------------
" => Key Mapping 
"------------------------------------------------

nnoremap <Leader>v :tabedit $MYVIMRC<CR>     " Fast edit the .vimrc file using ',v'

" Ctrl + H            将光标移到行首
imap <c-h> <ESC>I

" Ctrl + J            将光标移到下一行的行首
imap <c-j> <ESC>jI

" Ctrl + K            将光标移到上一行的末尾
imap <c-k> <ESC>kA

" Ctrl + L            将光标移到行尾
imap <c-l> <ESC>A

" Ctrl + Z            取代ESC模式键
imap <c-z> <ESC>

" Ctrl + S            保存文件
map <c-s> <ESC>:w<CR>
imap <c-s> <ESC>:w<CR>a
vmap <c-s> <ESC>:w<CR>
 
" Redesign moving keys in insert mode
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-H> <Left>
inoremap <C-L> <Right>

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Same when jumping around
"nnoremap g; g;zz
"nnoremap g, g,zz

" Navigation between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-O> <C-W>o

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Remap ; to :
nnoremap ; :
vnoremap ; :

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Map \<Space> to commenting
function! IsWhiteLine()
    if (getline(".")=~"^$")
        let oldlinenumber=line(".")
        :call NERDComment('n', 'Sexy')
        if (line(".")==oldlinenumber)
            :call NERDComment('n', 'Append')
        else
            normal! k
            startinsert!
        endif
    else
        normal! A 
        :call NERDComment('n', 'Append')
    endif
endfunction
nnoremap <silent>\<Space> :call IsWhiteLine()<CR>

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis
"================================================================

"------------------------------------------------
" => Functions
"------------------------------------------------
" ======= 引号 && 括号自动匹配 ======= "

:inoremap ( ()<ESC>i

:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i

:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i

:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i

":inoremap > <c-r>=ClosePair('>')<CR>

:inoremap " ""<ESC>i

:inoremap ' ''<ESC>i

:inoremap ` ``<ESC>i

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
"================================================================

"-------------------------------------------------
" => Search Related
"-------------------------------------------------

set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set hlsearch " Highlight search terms
set incsearch " Find as you type search
set gdefault " turn on 'g' flag

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s? s?\v

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" Use ,Space to toggle the highlight search
nnoremap <Leader><Space> :set hlsearch!<CR>
"================================================================

"-------------------------------------------------
" => Fold Related
"-------------------------------------------------

set foldlevelstart=0 " Start with all folds closed
set foldcolumn=1 " Set fold column

" Space to toggle and create folds.
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Set foldtext
function! MyFoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line.'…'.repeat(" ",fillcharcount).foldedlinecount.'…'.' '
endfunction
set foldtext=MyFoldText()
"================================================================

"-------------------------------------------------
" => Filetype Specific
"-------------------------------------------------

" QuickFix
augroup ft_quickfix
    autocmd!
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap textwidth=0
augroup END

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
augroup END

" C and C++
augroup ft_c
    autocmd!
    " TODO
augroup END

" Python
augroup ft_python
    autocmd!

    " Indent Python in the Google way.
    setlocal indentexpr=GetGooglePythonIndent(v:lnum)
    let s:maxoff = 50 " maximum number of lines to look backwards.
    function! GetGooglePythonIndent(lnum)
        " Indent inside parens.
        " Align with the open paren unless it is at the end of the line.
        " E.g.
        "   open_paren_not_at_EOL(100,
        "                         (200,
        "                          300),
        "                         400)
        "   open_paren_at_EOL(
        "       100, 200, 300, 400)
        call cursor(a:lnum, 1)
        let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
                    \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
                    \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
                    \ . " =~ '\\(Comment\\|String\\)$'")
        if par_line > 0
            call cursor(par_line, 1)
            if par_col != col("$") - 1
                return par_col
            endif
        endif
        " Delegate the rest to the original function.
        return GetPythonIndent(a:lnum)
    endfunction
    let pyindent_nested_paren="&sw*2"
    let pyindent_open_paren="&sw*2"

    function! ChoosePythonCompiler()
        echo "Please choose python compiler:\n"
        echo "1. Python2+\n"
        echo "2. Python3+\n"
        let flag=getchar()
        if flag==49
            call SingleCompile#ChooseCompiler('python', 'python')
            execute 'SingleCompileRun'
        elseif flag==50
            call SingleCompile#ChooseCompiler('python', 'python3')
            execute 'SingleCompileRun'
        endif
    endfunction
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>
augroup END

" Perl
augroup ft_perl
    autocmd!
    " TODO
augroup END

" Ruby
augroup ft_ruby
    autocmd!
    " TODO
augroup END
"================================================================

" 编译C源文件
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc -Wall -pedantic -std=c99 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunc

" 编译C++源文件
func! CompileCpp()
    exec "w"
    let compilecmd="!g++ -Wall -pedantic -std=c++98 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunc

" 编译Java源文件
func! CompileJava()
	exec "w"
    exec "!javac %"
endfunc

" 编译Haskell源文件
func! CompileHaskell()
	exec "w"
	let compilecmd="!ghc --make "
	let compileflag="-o %<"
	exec compilecmd." % ".compileflag
endfunc

" 根据文件类型自动选择相应的编译函数
func! CompileCode()
        exec "w"
        if &filetype == "c"
			exec "call CompileGcc()"
        elseif &filetype == "cpp"
			exec "call CompileCpp()"
		elseif &filetype == "java"
			exec "call CompileJava()"
		elseif &filetype == "haskell"
			exec "call CompileHaskell()"
		elseif &filetype == "lua"
			exec "!lua %<.lua"
		elseif &filetype == "perl"
			exec "!perl %<.pl"
        elseif &filetype == "python"
			exec "!python %<.py"
		elseif &filetype == "ruby"
			exec "!ruby %<.rb"
        endif
endfunc

" 运行可执行文件
func! RunResult()
        exec "w"
        if &filetype == "c"
			exec "! %<"
        elseif &filetype == "cpp"
			exec "! %<"
		elseif &filetype == "java"
			exec "!java %<"
		elseif &filetype == "haskell"
			exec "! %<"
		elseif &filetype == "lua"
			exec "!lua %<.lua"
		elseif &filetype == "perl"
			exec "!perl %<.pl"
        elseif &filetype == "python"
			exec "!python %<.py"
		elseif &filetype == "ruby"
			exec "!ruby %<.rb"
        endif
endfunc

" Ctrl + C 一键保存、编译
map <c-c> :call CompileCode()<CR>
imap <c-c> <ESC>:call CompileCode()<CR>
vmap <c-c> <ESC>:call CompileCode()<CR>

" Ctrl + R 一键保存、运行
map <c-r> :call RunResult()<CR>
imap <c-r> <ESC>:call RunResult()<CR>
vmap <c-r> <ESC>:call RunResult()<CR>
"================================================================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Tagbar
"--------------------------------------------------

nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => NERD_tree
"--------------------------------------------------

nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => NERD_commenter
"--------------------------------------------------

"let NERDCommentWholeLinesInVMode=2
"let NERDSpaceDelims=1
"let NERDRemoveExtraSpaces=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Neocomplcache
"--------------------------------------------------

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_auto_delimiter=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1

" Map <C-E> to cancel completion
inoremap <expr><C-E> neocomplcache#cancel_popup()

" Tab/Shift-Tab to cycle completions
inoremap <expr><Tab>  pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-P>" : "\<S-Tab>"

" CR/S-CR: close popup and save indent.
inoremap <expr><CR>  delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><S-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => snipMate
"--------------------------------------------------

let g:snips_trigger_key=',,s'
let g:snips_trigger_key_backwards=',,s'
snoremap <CR> a<BS>
snoremap <BS> a<BS>
snoremap <right> <ESC>a
snoremap <left> <ESC>bi
snoremap ' a<BS>'
snoremap ` a<BS>`
snoremap % a<BS>%
snoremap U a<BS>U
snoremap ^ a<BS>^
snoremap \ a<BS>\
snoremap <C-x> a<BS><c-x>` `' '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => delimitMate
"--------------------------------------------------

let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------

let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/cache/ctrlp'
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Ack
"--------------------------------------------------

"if executable('ack-grep') || executable('ack')
""    nnoremap <Leader>a :Ack!<Space>
"endif
"if has('unix') && executable('ack-grep')
""    let g:ackprg='ack-grep -H --nocolor --nogroup --column'
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Syntastic
"--------------------------------------------------

nnoremap <Leader>s :Errors<CR>
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------

if !has('gui_running')
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
endif

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => fugitive
"--------------------------------------------------

"if executable('git')
""    nnoremap <silent> <leader>gs :Gstatus<CR>
""    nnoremap <silent> <leader>gd :Gdiff<CR>
""    nnoremap <silent> <leader>gc :Gcommit<CR>
""    nnoremap <silent> <leader>gb :Gblame<CR>
""    nnoremap <silent> <leader>gl :Glog<CR>
""    nnoremap <silent> <leader>gp :Git push<CR>
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Gundo
"--------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => EasyTags
"--------------------------------------------------

function! InitializeTagDirectory()
    let parent=$HOME
    let prefix='.vim'
    let dirname='tags'
    let directory=parent.'/'.prefix.'/'.dirname.'/'
    if !isdirectory(directory)
        if exists('*mkdir')
            call mkdir(directory)
            let g:easytags_by_filetype=directory
        else
            echo "Warning: Unable to create directory: ".directory
            echo "Try: mkdir -p ".directory
        endif
    else
        let g:easytags_by_filetype=directory
    endif
endfunction
call InitializeTagDirectory()

let g:easytags_python_enabled=1
let g:easytags_python_script=1
let g:easytags_include_members=1
highlight cMember gui=italic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => SingleCompile
"--------------------------------------------------

"nnoremap <Leader>r :SingleCompileRun<CR>
"let g:SingleCompile_showquickfixiferror=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Zencoding
"--------------------------------------------------

let g:user_zen_leader_key='<C-Z>'
let g:user_zen_settings={'indentation':'   '}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Golden Ratio
"--------------------------------------------------

" Disable Golden Ratio plugin when in diff mode
"if &diff
""  let g:loaded_golden_ratio=1
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Splitjoin
"--------------------------------------------------

"nnoremap sj :SplitjoinSplit<CR>
"nnoremap sk :SplitjoinJoin<CR>
"let g:splitjoin_normalize_whitespace=1
"let g:splitjoin_align=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Unite
"--------------------------------------------------

"nnoremap <Leader>m :Unite<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => vimux
"--------------------------------------------------

"nnoremap <Leader>vp :VimuxPromptCommand<CR>
"vnoremap <Leader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
"nnoremap <Leader>vx :VimuxClosePanes<CR>
"nnoremap <Leader>vq :VimuxCloseRunner<CR>
"nnoremap <Leader>vi :VimuxInspectRunner<CR>
"nnoremap <Leader>vl :VimuxRunLastCommand<CR>
"nnoremap <Leader>vc :VimuxClearRunnerHistory<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Bundles {
    " Deps
filetype off " Required!
let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
 
" Local bundles if avaiable
if filereadable(expand("~/.vimrc.bundles.local"))
    source ~/.vimrc.bundles.local
endif
 
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
if executable('ack-grep')
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    Bundle 'mileszs/ack.vim'
elseif executable('ack')
    Bundle 'mileszs/ack.vim'
endif

" Use local bundles if available {
    if filereadable(expand("~/.vimrc.bundles.local"))
        source ~/.vimrc.bundles.local
    endif
" }
 
 " Bundle Plugins
 "==============================
Bundle 'https://github.com/tomasr/molokai.git'    
colorscheme molokai
Bundle 'Lokaltog/vim-powerline'

Bundle 'honza/snipmate-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'garbas/vim-snipmate'
Bundle 'corntrace/bufexplorer
Bundle 'Shougo/neocomplcache'
Bundle 'sjl/gundo.vim'

"PHP
Bundle 'spf13/PIV'
Bundle 'kien/ctrlp.vim'

" HTML
Bundle 'mattn/zencoding-vim'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
   
  filetype plugin indent on " Required!
"==============================
"--------------------------------------------------
" => Local Setting
"--------------------------------------------------

" Use local vimrc if available
if filereadable(expand("~/_vimrc.local"))
    source ~/_vimrc.local
endif

" Use local gvimrc if available and gui is running
if has('gui_running')
    if filereadable(expand("~/_gvimrc.local"))
        source ~/_gvimrc.local
    endif
endif
"================================================================