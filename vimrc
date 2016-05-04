set ignorecase
set nowrap

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

set incsearch              " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到  
set hlsearch

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"set mouse=n

nmap lb 0
nmap le $

map <F3> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F4> :!cscope -Rbq<CR>

let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1 
let Tlist_WinWidth=30

" Auto update tags
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
"autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()
autocmd BufWritePost *.cpp,*.h,*.c :TlistUpdate

set cscopequickfix=s-,c-,d-,i-,t-,e- 
nmap <C-n> :cnext<CR>
nmap <C-p> :cprev<CR> 

set nocp  
filetype plugin on 

let g:SuperTabDefaultCompletionType="context"

let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0 

let g:winManagerWidth = 30

let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree"
      
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
      
function! NERDTree_IsValid()  
    return 1  
endfunction  
      
"nmap wm :WMToggle<CR> :TlistToggle<CR>
nmap wm :WMToggle<CR>

set cursorline
"hi CursorLine   cterm=NONE ctermbg=blue ctermfg=white guibg=darkred guifg=white

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=25
" 设置NERDTree子窗口位置
"let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
