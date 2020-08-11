" kelvinzhao's vimrc
" support Italic 
set t_ZH=[3m	
set t_ZR=[23m
highlight Comment cterm=italic gui=italic

" -------------------------------------------------------------------------------------
" 一些插件 Plugins
" -------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'				" 显示缩进
Plug 'davidhalter/jedi-vim'				" 补全、提示函数结构、显示pydoc等
Plug 'tell-k/vim-autopep8'				" 代码美化
Plug 'scrooloose/nerdtree'				" 目录树
Plug 'nvie/vim-flake8' 					" F7 检查代码
Plug 'iamcco/markdown-preview.nvim', {'do':{->mkdp#util#install()},'for':['markdown','vim-plug']}
Plug 'plasticboy/vim-markdown'			" markdown 语法高亮
Plug 'takac/vim-hardtime'				" 养成不使用方向键和hjkl键
Plug 'ybian/smartim'					" vim mode切换时自动换输入法
Plug 'godlygeek/tabular'				" 文本对齐
Plug 'machakann/vim-highlightedyank'	" yank后高亮一下
Plug 'tpope/vim-repeat'					" Tim Pope大神，让“.“可以重复执行插件动作
Plug 'tpope/vim-commentary'				" gc5j or gcc for current line, 方便的注释
Plug 'tpope/vim-surround'				" Tim Pope大神用于增加、修改、删除围绕符号
Plug 'skywind3000/asyncrun.vim' 		" 可以在Quickfix中显示python运行结果
Plug 'majutsushi/tagbar'				" 在一个窗体中显示函数及变量
Plug 'luochen1990/rainbow'				" 彩色显示成对儿的符号
Plug 'mbbill/undotree'					" 在一个窗体中显示文件的修改树
" vim 主题
Plug 'morhetz/gruvbox'
" 以下Plug用于Vim 与 tmux之间的整合
Plug 'christoomey/vim-tmux-navigator'	" vim和tmux之间无缝的移动窗口焦点
Plug 'benmills/vimux'					" vim和tmux之间交互
Plug 'julienr/vim-cellmode'				" 类似Jupyte Notebook在tmux中调试ipython
call plug#end()

" -------------------------------------------------------------------------------------
" 通用设置 General Settings
" -------------------------------------------------------------------------------------

filetype on
filetype plugin on
syntax on
set path+=**  	" Searching down into subfolders and Provides tab-completion for all file-related tasks 
set wildmenu	" Display all matching files when we tab complete
set completeopt=menu,preview
set number 
set nocompatible
set noerrorbells
set nobackup
set wrap
set noswapfile
set nowb
set autoread
set shortmess=a
set backspace=2 "2 same as :set backspace=indent,eol,start"
set hlsearch 	" highlight searches"
set incsearch 	" do incremental searching, search as you type"
set ignorecase 	" ignore case when searching"
set smartcase 	" no ignorecase if Uppercase char present"
let mapleader = "\<Space>"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set cursorline
set cursorlineopt=number
" 设置缩进
set tabstop=4
set shiftwidth=4
set autoindent
set foldmethod=indent
set nofoldenable
set foldlevelstart=3
" set colorcolumn=+1
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set concealcursor=nc
set textwidth=80

" -------------------------------------------------------------------------------------
" 外观样式 Themes
" -------------------------------------------------------------------------------------

" 设置主题颜色
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic=1 
let g:gruvbox_bold=1
let g:gruvbox_italicize_strings=1
colorscheme gruvbox

" Switch
"if strftime("%H") > 20
"	set background=dark
"elseif strftime("%H") > 8
"	set background=light
"else
"	set background=dark
"endif
set background=dark

" -------------------------------------------------------------------------------------
" 键盘映射 Key mappings
" -------------------------------------------------------------------------------------

imap jk <esc><esc>
cmap jk <esc><esc> 
inoremap <C-c> <esc>
" \sa 选择全部文本
map <leader>sa ggVG"
nmap > :vertical resize +5<CR>
nmap < :vertical resize -5<CR>
" 基于屏幕行移动
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" H移动到第一个字符，L移动到最后一个字符
nnoremap H ^
vmap H ^
nnoremap L $
vmap L $
" Y 复制从光标到行
map Y y$
" 取消查询结果高亮
nnoremap <silent><leader><leader> :noh<CR>
" 超级权限保存文件
cmap w!! w !sudo tee >/dev/null %
" ctrl-s 映射为保存:w
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>
" 视图模式下移动行
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" 视图模式下缩进
vnoremap < <gv
vnoremap > >gv
" 在Tab之间切换
map <leader>, <esc>:tabprevious<CR>
map <leader>. <esc>:tabnext<CR>
map <leader><tab> <esc>:tabs<CR>
" 视图模式下，leader-c将高亮内容拷贝至系统剪贴板
vnoremap <leader>c "+y

" -------------------------------------------------------------------------------------
" 插件设置 Plugin settings
" -------------------------------------------------------------------------------------

" 突出显示当前行
let g:CursorLineCurrentWindow_OptionNames = ['cursorline']

" vim-autopep8 设置， 禁止Autopep8 显示区别窗口
let g:autopep8_disable_show_diff=1

" NERDTree设置
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 32
let NERDTreeAutoDeletBuffer = 1
let NERDTreeIgnore=['\.pyc','\~$','.swp']
map <leader>t :NERDTreeMirror<CR>
map <leader>t :NERDTreeToggle<CR>
" Buffer变更的时候自动刷新NERDTree
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" Jedi-vim 设置
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "<leader>df"
let g:jedi#documentation_command = "L"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-N>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures=2

" vim-markdown设置
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_toc_autofit = 1

" Powerline设置 
set rtp+=~/opt/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2 " 设置vim状态栏数量为2，用于显示powerline的内容
set showtabline=2 " 始终显示窗口上方的tabline
set noshowmode " 隐藏默认的模式文本
set t_Co=256

" hardtime设置
let g:hardtime_default_on = 1	" 每个buffer都启用
let g:hardtime_showmsg = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*","undotree.*","__Tagbar.*"]
" 启停：HardTime On / HardTime Off
" 进入normal模式自动切换到英文输入法
let g:smartim_default = 'com.apple.keylayout.ABC'
let g:smartim_saved = 'com.apple.inputmethod.SCIM.ITABC'

" flake8 设置
" ~/.flake8 文件中保存忽略的错误类型
let g:flake8_show_in_gutter=1
let g:flake8_error_marker='E'     " set error marker to 'E'
let g:flake8_warning_marker='W'   " set warning marker to 'W'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
let g:flake8_naming_marker=''      " disable naming warnings
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" 用来快速关闭检查语法的结果buffer
nnoremap <leader>pq :wincmd j <CR> :q <CR>

" Asyncrun.vim 设置
" 禁止Python的行缓存，这样可以实时查看结果
let $PYTHONNUNBUFFERED=1
let g:asyncrun_open = 15

" vim-tmux-navigate设置
let g:tmux_navigator_disable_when_zoomed = 1
" vim-tmux-navigate默认时ctrl-hjkl无缝移动，这里无需remap

" vim-cellmode 设置
" 替换发送按键
let g:cellmode_default_mappings='0'
" vmap <silent> <C-c> :call RunTmuxPythonChunk()<CR>
" noremap <silent> <C-b> :call RunTmuxPythonCell(0)<CR>
noremap <silent> <C-g> :call RunTmuxPythonCell(0)<CR>
noremap <silent> <C-b> :call RunTmuxPythonAllCellsAbove()<CR>
" 定义代码块发送到Tmux哪个session中的哪个window，不写则自动查找
let g:cellmode_tmux_sessionname=''
let g:cellmode_tmux_windowname='ipython'
let g:cellmode_tmux_panenumber='2'
" 或者使用这一句也可以
" let g:tmux_target='ipython:ipython.0'

" Rainbow Parenthese设置
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'yellow', 'cyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" undotree设置
nnoremap <F2> :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1

" Surround tips
" cs"<q>	means change " to <q>...</q>
" cst<q>	means change tag pair to <q>...</q>
" cs)]		means change (...) to [..]
" cs)[		means change (...) to [ ... ]
" ysiw)		means add (...) pair around word when cursor in word now
" ysW)		means add (...) pair aournd WORD when cusor right before the WORD
" ds)		means delete surround ()
" dst		means delte surround tag
" yssB		means add {...} surround the whole line. 'yss' means opt whole line
" alias of marks:
"		b   )
"		B	}
"		r	]
"		a	>
" word, WORD, line and Paragraph
" 		w	word
"		W	WORD
"		s	line
"		p	Paragraph
" yS or ySS means the word or line will be indented in single line
" when in Visual mode, just press S to add surround the selected parts
" f or F or <C-F> can be used to prompt function name to add before surrounding.

" -------------------------------------------------------------------------------------
" 片段 Snippets
" -------------------------------------------------------------------------------------

nnoremap <leader>banner :-1read $HOME/.vim/snippets/.textdecorator.vim<CR>jA

" -------------------------------------------------------------------------------------
" K，新开buffer显示关键词Python文档
" 来源：https://vim.fandom.com/wiki/Access_Python_Help
" -------------------------------------------------------------------------------------

if has("python")
	" let python figure out the path to pydoc
	python << EOF
import sys
import vim
vim.command("let s:pydoc_path=\'" + sys.prefix + "/lib/pydoc.py\'")
EOF
else
	" manually set the path to pydoc
	let s:pydoc_path = "~/opt/anaconda3/lib/python3.7/pydoc.py"
endif

nnoremap <buffer> K :<C-u>let save_isk = &iskeyword \|
\ set iskeyword+=. \|
\ execute "Pyhelp " . expand("<cword>") \|
\ let &iskeyword = save_isk<CR>
command! -nargs=1 -bar Pyhelp :call ShowPydoc(<f-args>)

function! ShowPydoc(what)
	let bufname = a:what . ".pydoc"
	" check if the buffer exists already
	if bufexists(bufname)
		let winnr = bufwinnr(bufname)
		if winnr != -1
			" if the buffer is already displayed, switch to that window
			execute winnr "wincmd w"
		else
			" otherwise, open the buffer in a split
			execute "sbuffer" bufname
		endif
	else
		" create a new buffer, set the nofile buftype and don't display it in the
		" buffer list
		execute "split" fnameescape(bufname)
		setlocal buftype=nofile
		setlocal nobuflisted
		" read the output from pydoc
		execute "r !" . shellescape(s:pydoc_path, 1) . " " . shellescape(a:what, 1)
	endif
	" go to the first line of the document
	1
endfunction

" -------------------------------------------------------------------------------------
" 结合vim-tmux-navigate，让<leader>hjkl和<C-hjkl>都能无缝移动
" https://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
" -------------------------------------------------------------------------------------

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      " redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <leader>h :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <leader>j :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <leader>k :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <leader>l :call TmuxOrSplitSwitch('l', 'R')<cr>
  nnoremap <silent> <leader>\ <C-w>p
else
  map <leader>h <C-w>h
  map <leader>j <C-w>j
  map <leader>k <C-w>k
  map <leader>l <C-w>l
  map <leader>\ <C-w>p
endif

" -------------------------------------------------------------------------------------
" 自动执行 Autocmd
" -------------------------------------------------------------------------------------

augroup vimrcEx
au!
	" vim 启动自动运行 NERDTree
	autocmd VimEnter * silent NERDTree | wincmd p
	autocmd FileType nerdtree setlocal relativenumber
	" 配置保存立刻生效
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	" 离开插入状态时回到英文，进入插入状态时，恢复到之前最后的输入法
	autocmd InsertLeave * call Smartim_SelectDefault()
	autocmd InsertEnter * call Smartim_SelectSaved() 
	" Jedi-vim, don't want the docstring window to popup during completion
	autocmd InsertEnter * set norelativenumber | set cursorlineopt=both | set conceallevel=0
	autocmd InsertLeave * set relativenumber | set cursorlineopt=number | set conceallevel=2
	" Python 超出界限时自动显示为红色
	" autocmd BufWinEnter *.py let w:m2=matchadd('ErrorMsg','\%>80v.\+',-1)
	" Python文件保存时立刻检查语法
	autocmd BufWritePost *.py call flake8#Flake8()
	autocmd FileType python setlocal completeopt-=preview
	" 如果当前vim 运行于 tmux中，则F5会调用VimuxRun来执行
	if exists('$TMUX')
		autocmd FileType python map <buffer> <F5> :call VimuxRunCommand("clear;python3 ". expand('%:p'))<CR>
	else
		autocmd FileType python map <buffer> <F5> :AsyncRun time python3 %<CR>
	endif
	" F8 自动调用Autopep8检查python代码
	autocmd FileType python map <buffer> <F8> <Esc>:call Autopep8()<CR>
	" F10 切换Tagbar
	autocmd FileType python nmap <F10> :TagbarToggle<CR>
	" F9 预览markdown文件
	autocmd FileType markdown map <F9> <Plug>MarkdownPreviewToggle
augroup END
