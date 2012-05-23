syntax enable
syntax on
colorscheme bensday

"让当前不被编辑的文件的方法列表自动折叠起来 
let Tlist_File_Fold_Auto_Close=1
" 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1
"显示taglist菜单
let Tlist_Show_Menu=1


let g:winManagerWindowLayout="FileExplorer,BufExplorer|TagList"

"设置宽度
let g:winManagerWidth = 30

nmap wm :WMToggle<cr>

set nu
set encoding=utf-8

set cscopequickfix=s-,c-,d-,i-,e-

"自动补全
filetype plugin indent on
set completeopt=longest,menu
set nocp
filetype plugin on 

"括号自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

"中文乱码问题
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc

" C++的编译和运行
 map <F6> :call CompileRunGpp()<CR>
 func! CompileRunGpp()
 exec "w"
 exec "!g++ % -o %<"
 exec "! ./%<"
 endfunc

function! QfMakeConv()
	let qflist = getqflist()
	for i in qflist
		let i.text = iconv(i.text,"utf-8","cp936")
	endfor
	call setqflist(qflist)
endfunction
au QuickfixCmdPost make call QfMakeConv()
