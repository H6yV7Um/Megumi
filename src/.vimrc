"******************************基本配置******************************
set nocompatible
filetype on
filetype plugin on
set history=1000
syntax on
set smartindent
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set showmatch
set ruler
set incsearch
set hlsearch
set nu
set backspace=2
let mapleader='\'
set fdm=indent
set foldlevel=9999
nnoremap <space> /
set noswapfile
set ignorecase
set splitbelow

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"******************************字符编码设置**************************
"set encoding=utf-8
"set termencoding=utf-8

"******************************数字映射**************************
nmap ! :Autoformat<CR>
nnoremap # :nohl<CR>
nnoremap % @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
noremap 4 <End>
noremap ( :lclose<CR>

"******************************配置插件******************************
call plug#begin('~/.vim/plugged')

" 文件查找
Plug 'junegunn/fzf', { 'on':'FZF', 'dir': '~/.fzf', 'do': './install --all' }

" 补全
Plug 'Valloric/YouCompleteMe', {'on': []}

" 语法检查
Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticCheck' }

" 基于语言的语法补全
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" 目录结构
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" 代码格式化
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }

" 括号自动补全
Plug 'Raimondi/delimitMate'

" airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" vim主题
Plug 'flazz/vim-colorschemes'

" php格式化
"Plug 'stephpy/vim-php-cs-fixer'

" html以及xml标签匹配
"Plug 'Valloric/MatchTagAlways'

" 多光标编辑
"Plug 'terryma/vim-multiple-cursors'

" 代码注释
Plug 'scrooloose/nerdcommenter'

" vue高亮
"Plug 'posva/vim-vue'

" java补全
"Plug 'artur-shaik/vim-javacomplete2'

" PHP专用格式化
Plug 'beanworks/vim-phpfmt', { 'on': 'PhpFmt' }

" grep
Plug 'mhinz/vim-grepper',  { 'on': 'Grepper' }

" typescript高亮
"Plug 'HerringtonDarkholme/yats.vim'

" 自动识别tab, 解决ycm与ultisnips的冲突
Plug 'ervandew/supertab'


" html5高亮以及补全
"Plug 'othree/html5.vim'

" css3高亮以及补全
"Plug 'hail2u/vim-css3-syntax'

" js语法高亮
"Plug 'pangloss/vim-javascript'

" html标签生成
"Plug 'mattn/emmet-vim'

" js代码补全
"Plug 'ternjs/tern_for_vim'

" typescript代码补全
"Plug 'Quramy/tsuquyomi'

" vim异步调用其他命令比如make
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" go一站式方案
"Plug 'fatih/vim-go'

" docker file高亮插件
"Plug 'ekalinin/Dockerfile.vim'

" nerdtree git状态显示
"Plug 'Xuyuanp/nerdtree-git-plugin'

" 显示文件的修改状态
"Plug 'airblade/vim-gitgutter'

" 好用的git命令
Plug 'tpope/vim-fugitive'

" Thrift
Plug 'solarnz/thrift.vim'

" cpp enhanced color
"Plug 'octol/vim-cpp-enhanced-highlight'

" sql高亮
Plug 'shmup/vim-sql-syntax'

call plug#end()

"******************************配置GUI******************************
if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif
function ColorSchemeSelect()
    if $ITERM_PROFILE == "desert"
        colorscheme desert
    elseif $ITERM_PROFILE == "solarized-dark"
        set background=dark
        colorscheme solarized
    elseif $ITERM_PROFILE == "solarized-light"
        colorscheme solarized
    elseif $ITERM_PROFILE == "tomorrow-night"
        colorscheme tomorrow-night
    elseif $ITERM_PROFILE == "tomorrow"
        colorscheme tomorrow
    endif
endf

call ColorSchemeSelect()

hi Search ctermfg=black cterm=bold ctermbg=white

if has("gui_macvim")
    set guifont=Menlo:h13
endif

"******************************配置ycm******************************
augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('YouCompleteMe')
                \ | autocmd! load_ycm
augroup END


autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files= 1
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings = 1

let g:ycm_python_binary_path = 'python'

let g:ycm_always_populate_location_list = 1
"let g:ycm_show_diagnostics_ui = 0

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 设置goto打开新buffer
let g:ycm_goto_buffer_command = 'new-or-existing-tab'

"******************************配置airline******************************
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"nmap <C-s> <Plug>AirlineSelectPrevTab
"nmap <C-d> <Plug>AirlineSelectNextTab
nmap <S-tab> :tabp<CR>
nmap <tab> :tabn<CR>
noremap ¡ 1gt
noremap ™ 2gt
noremap £ 3gt
noremap ¢ 4gt
noremap ∞ 5gt
noremap § 6gt
noremap ¶ 7gt
noremap • 8gt
noremap ª 9gt
"******************************配置UltiSnips******************************
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

" UltiSnips和YCM连用
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"******************************配置php-cs-fixer******************************
let g:phpfmt_standard = 'PSR2'

let g:phpfmt_autosave = 0
"******************************配置前端******************************
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:mta_use_matchparen_group = 0

"******************************配置WinManager******************************
let g:winManagerWindowLayout='NERDTree|TagList'
let g:NERDTree_title = "[NERDTree]"

let NERDTreeIgnore = ['\.pyc', '\~$', '\.swp', '\.lo']
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let g:winManagerWidth = 30

"******************************配置Git插件********************************
set updatetime=250
nmap gb :Gblame<CR>

"******************************配置Syntastic******************************
augroup load_syntastic
    autocmd!
    autocmd BufWritePre * call plug#load('syntastic')
                \ | autocmd! load_syntastic
augroup END
nmap <leader>c :SyntasticCheck<CR>

set statusline+=%#errormsg#
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:ycm_semantic_triggers = {
            \'css': [ 're!^\s{2}', 're!:\s+', 're!^\t' ],
            \'javascript': ['.'],
            \'go': ['.'],
            \'html': ['re!</'],
            \'vue': ['re!</'],
            \}

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501,F401,F841,F403'
let g:syntastic_quiet_messages = {
            \"type": "style",
            \"!level": "errors",
            \}

let g:syntastic_c_compiler = 'clang5'
let g:syntastic_c_compiler_options = '
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/main/
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/Zend/
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/TSRM/
            \'

let g:syntastic_cpp_compiler = 'clang5++'
let g:syntastic_cpp_compiler_options = '
            \ -std=c++11 -stdlib=libc++
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/main/
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/Zend/
            \ -I/usr/local/Cellar/php70/7.0.18_10/include/php/TSRM/
            \'
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:syntastic_go_checkers = ['go']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

let g:syntastic_javascript_checkers=['eslint']

" 针对java和php关闭检查，打开大文件会卡，建议手动调用
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['php', 'java'] }

let g:go_fmt_command = "goimports"

"******************************配置文件自动补全******************************

"******************************Autoformat******************************
"c++以及java自动格式化
let g:formatdef_style_c = '"astyle -p -U --pad-oper --mode=c"'
let g:formatters_cpp = ['style_c']
let g:formatdef_style_java = '"astyle -p -U --pad-oper --mode=java"'
let g:formatters_java = ['style_java']


" python google lint
let g:formatter_yapf_style = 'google'

"****************************** Grepper FZF *******************************

nmap <leader>g :Grepper -tool git<CR>
nmap <leader>af :tabnew<CR>:FZF<CR>
nmap <leader>ag :tabnew<CR>:Grepper -tool git<CR>
nmap <leader>f :FZF<CR>

"**************************** delimitMate *******************************
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
function MyBSMap()
    if len(maparg('<Plug>delimitMateBS', 'i'))
        let r = "\<Plug>delimitMateBS"
    else
        let r = "\<BS>"
    endif
    return r
endf

imap <expr> <BS> MyBSMap()

"****************************** 自定义函数 ******************************
"配置php保存自动检测语法
let g:PHP_SYNTAX_CHECK_BIN = 'php'

function PythonRun()
    let result = system('python '.expand('%'))
    call SplitDisplay(result, 10)
endfunction

function PhpRun()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' '.expand('%'))
    call SplitDisplay(result, 10)
endfunction

function GoRun()
    let result = system('go run ' . expand('%'))
    call SplitDisplay(result, 10)
endfunction

function Vuelint()
    let result=system('eslint -c ~/.vim/.eslintrc.js --ignore-path ~/.vim/.eslintignore --ext .vue '.expand('%'))
    call SplitDisplay(result, 10)
endfunction

function SplitDisplay(content, filelen)
    execute'rightbelow '.a:filelen.'split __SplitDisplay__'
    normal! ggdG
    setlocal filetype=tmp
    setlocal buftype=nofile
    call append(0, split(a:content, '\v\n'))
endfunction

function CENV()
    let result=system('cp ~/.c_ycm_extra_conf.py `pwd`/.ycm_extra_conf.py')
endf


function CPPENV()
    let result=system('cp ~/.c++_ycm_extra_conf.py `pwd`/.ycm_extra_conf.py')
endf

function GOENV()
    let result=system('cp ~/.goenvrc `pwd`/.envrc && direnv allow `pwd`')
endf

function! CompileC()
    exec "w"
    exec "cclose"
    if &filetype == 'cpp'
        set makeprg=g++\ -o\ %<\ %
    elseif &filetype == 'c'
        set makeprg=gcc\ -o\ %<\ %
    endif
    silent make
    exec "normal :"

    let myfile=expand("%:r")
    if filereadable(myfile)
        execute "! ./%< && rm ./%<"
    else
        cope5
    endif
endf

function PhpHead()
    let line = getline(1)
    if !(line =~ '\<\?php')
        call append(0, '<?php')
    endif

    let line = getline(2)
    if !(line =~ '\S*baixing.com\S*')
        call append(1, '// jixunzhen@baixing.com')
    endif
endf

"******************************自定义trigger******************************

if $AUTO_RSP == 1
    autocmd BufWritePost * :silent exec "!rsp > /dev/null 2>&1"|redraw!
endif

"******************************自定义快捷键******************************
map <S-q> :q!<CR>
map <S-w> :w<CR>

map <C-a> ggVG
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <S-z> <C-W>o<S-q>
nmap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>b <C-o>
map <S-l> <leader>c<space>
map e <Plug>CamelCaseMotion_e
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b

noremap <S-k> <nop>
vmap c "+y
noremap <C-p> "+p
nmap mn :WMToggle<CR>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cmap !w w !sudo tee >/dev/null %
nnoremap gu gU
nnoremap gl gu
nmap ; :

"****************************三重JK!!!***********************************
inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>

"****************************语言相关***********************************
autocmd BufNewFile,BufRead * call AutoCMD()

function DefineFileType()
    let fext = expand('%:e')
    if (fext == 'thrift')
        set filetype=thrift
    elseif (fext == 'yaml' || fext == 'yml')
        set filetype=yaml
    elseif (fext == 'conf' || fext == 'ini')
        set filetype=conf
    elseif (fext == 'dcf')
        set filetype=dockerfile
    endif
endf

function AutoCMD()
    call DefineFileType()
    if (&ft == 'python')
        call PythonAutoCMD()
    elseif (&ft == 'thrift')
        call ThriftAutoCMD()
    elseif (&ft == 'php')
        call PHPAutoCMD()
    elseif (&ft == 'html')
        call HTMLAutoCMD()
    elseif (&ft == 'markdown')
        call MarkdownAutoCMD()
    elseif (&ft == 'xml')
        call XMLAutoCMD()
    elseif (&ft == 'css')
        call CSSAutoCMD()
    elseif (&ft == 'javascript')
        call JavascriptAutoCMD()
    elseif (&ft == 'vue')
        call VueAutoCMD()
    elseif (&ft == 'cpp')
        call CPPAutoCMD()
    elsei (&ft == 'c')
        call CAutoCMD()
    elseif (&ft == 'typescript')
        call TypescriptAutoCMD()
    elseif (&ft == 'go')
        call GoAutoCMD()
    elseif (&ft == 'yaml')
        call YamlAutoCMD()
    elseif (&ft == 'java')
        call JavaAutoCMD()
    elseif (&ft == 'conf')
        call ConfAutoCMD()
    endif
endf

function PythonAutoCMD()
    nnoremap <leader>r :call PythonRun()<CR>
    inoremap <C-a> %
    set colorcolumn=80
endf

function ThriftAutoCMD()
    nnoremap ! <nop>
endf

function PHPAutoCMD()
    nnoremap <leader>r :call PhpRun()<CR>
    call PhpHead()
    inoremap <C-a> $
    nmap ! :PhpFmt<CR>
endf

function HTMLAutoCMD()
    set omnifunc=htmlcomplete#CompleteTags
    set tabstop=2
    set shiftwidth=2
    nnoremap <leader>r :!open %<CR>
    imap <S-tab> <C-y>,

endf

function MarkdownAutoCMD()
    set omnifunc=htmlcomplete#CompleteTags
endf

function XMLAutoCMD()
    set omnifunc=xmlcomplete#CompleteTags
endf

function CSSAutoCMD()
    set omnifunc=csscomplete#CompleteCSS
    set tabstop=2
    set shiftwidth=2
    inoremap <C-a> %
endf

function JavascriptAutoCMD()
    set omnifunc=javascriptcomplete#CompleteJS
    set tabstop=2
    set shiftwidth=2
    nmap <leader>c :SyntasticCheck<CR>
    inoremap <C-a> $
endf

function VueAutoCMD()
    nnoremap <leader>c :call Vuelint()<CR>
    set tabstop=2
    set shiftwidth=2
    syntax sync fromstart
endf

function CPPAutoCMD()
    nnoremap <leader>r :call CompileC()<CR>
    inoremap <C-a> *
    inoremap <C-x> &
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_experimental_simple_template_highlight = 1
endf

function CAutoCMD()
    nnoremap <leader>r :call CompileC()<CR>
    inoremap <C-a> *
    inoremap <C-x> &
endf

function TypescriptAutoCMD()
    nmap <leader>d :TsuquyomiDefinition<CR>
    nmap <leader>i :TsuImport<CR>
    nnoremap <leader>c :make<CR>
endf

function GoAutoCMD()
    set completefunc=youcompleteme#Complete
    set completeopt=longest,menuone
    map <leader>r :call GoRun()<CR>
    imap ;; :=| imap <C-a> &
    noremap <S-k> <nop>
    nmap ! :GoFmt<CR>
endf

function YamlAutoCMD()
    set tabstop=2
    set shiftwidth=2
endf

function JavaAutoCMD()
    set omnifunc=javacomplete#Complete
    nmap <leader>c :SyntasticCheck<CR>
    nmap <leader>i <Plug>(JavaComplete-Imports-AddSmart)
    nmap <leader>u <Plug>(JavaComplete-Imports-RemoveUnused)
endf

function ConfAutoCMD()
    setf dosini
endf