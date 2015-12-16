"快捷键映射
let mapleader = "\<Space>"
" Pathogen or Vundle (deafult is Vundle) {{{

" Comment-out if you want to use pahogen
" execute pathogen#infect()
" com! -nargs=+ Bundle

" man.vim: invoked by :Man {name}
source $VIMRUNTIME/ftplugin/man.vim

" let Vundle manage Vundle, required
" ---------------------------------------------------
Plugin 'gmarik/Vundle.vim'

"}}}:

" general plugins {{{

" ex-config:
" ---------------------------------------------------
Plugin 'exvim/ex-config'
nnoremap <unique> <leader>ve :call exconfig#edit_cur_vimentry ()<CR>

" ex-utility:
" ---------------------------------------------------
Plugin 'exvim/ex-utility'

nnoremap <unique> <silent> <Leader>bd :EXbd<CR>
nnoremap <unique> <silent> <C-l> :EXbn<CR>
nnoremap <unique> <silent> <C-h> :EXbp<CR>
nnoremap <unique> <silent> <C-Tab> :EXbalt<CR>
nnoremap <unique> <silent> <Leader><Tab> :EXsw<CR>
nmap <unique> <silent> <Leader><Esc> :EXgp<CR><ESC>

" ex-aftercolor
" ---------------------------------------------------
Plugin 'exvim/ex-aftercolors'

" ex-vimentry
" ---------------------------------------------------
Plugin 'exvim/ex-vimentry'

" ex-project
" ---------------------------------------------------
Plugin 'exvim/ex-project'

" ex-gsearch
" ---------------------------------------------------
Plugin 'exvim/ex-gsearch'

call exgsearch#register_hotkey( 100, 0, '<leader>gs', ":EXGSearchToggle<CR>", 'Toggle global search window.' )
call exgsearch#register_hotkey( 101, 0, '<leader>gg', ":EXGSearchCWord<CR>", 'Search current word.' )
call exgsearch#register_hotkey( 102, 0, '<leader><S-f>', ":GS ", 'Shortcut for :GS' )

" ex-tagselect
" ---------------------------------------------------
Plugin 'exvim/ex-tags'

call extags#register_hotkey( 100, 0, '<leader>ts', ":EXTagsToggle<CR>", 'Toggle tag select window.' )
call extags#register_hotkey( 101, 0, '<leader>]', ":EXTagsCWord<CR>", 'Tag select current word.' )
" DISABLE: nnoremap <unique> <leader>] :exec 'ts ' . expand('<cword>')<CR>

" ex-symbol
" ---------------------------------------------------
Plugin 'exvim/ex-symbol'

call exsymbol#register_hotkey( 100, 0, '<leader>ss', ":EXSymbolList<CR>", 'List all symbols.' )
call exsymbol#register_hotkey( 101, 0, '<leader>sq', ":EXSymbolOpen<CR>", 'Open symbols window.' )
call exsymbol#register_hotkey( 102, 0, '<leader>sg', ":EXSymbolCWord<CR>", 'List symbols contains current word.' )

if has('gui_running')
    if has ('mac')
        call exsymbol#register_hotkey( 102, 0, 'Ò', ":EXSymbolList<CR>:redraw<CR>/", 'List all symbols and stay in search mode.' )
    else
        call exsymbol#register_hotkey( 102, 0, '<M-L>', ":EXSymbolList<CR>:redraw<CR>/", 'List all symbols and stay in search mode.' )
    endif
endif
let g:ex_symbol_select_cmd = 'TS'

" ex-cscope
" ---------------------------------------------------
Plugin 'exvim/ex-cscope'

call excscope#register_hotkey( 100, 0, '<leader>cd', ":EXCSToggle<CR>", 'Toggle cscope window.' )

" ex-qfix
" ---------------------------------------------------
Plugin 'exvim/ex-qfix'

call exqfix#register_hotkey( 100, 0, '<leader>qf', ":EXQFixToggle<CR>", 'Toggle quickfix window.' )
call exqfix#register_hotkey( 101, 0, '<leader>qq', ":EXQFixPaste<CR>", 'Open quickfix window and paste error list from register *.' )

" ex-hierarchy
" ---------------------------------------------------
Plugin 'exvim/ex-hierarchy'

nnoremap <unique> <leader>hv :EXHierarchyCWord<CR>

" ex-taglist: invoke by <F4>
" ---------------------------------------------------
Plugin 'exvim/ex-taglist'

" F4:  Switch on/off TagList
nnoremap <unique> <silent> <F4> :TlistToggle<CR>

"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 0 " Close the taglist window when a file or tag is selected.
let Tlist_BackToEditBuffer = 0 " If no close on select, let the user choose back to edit buffer or not
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let Tlist_Compact_Format = 1 " do not show help
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]

" add javascript language
let tlist_javascript_settings = 'javascript;v:global variable:0:0;c:class;p:property;m:method;f:function;r:object'
" add hlsl shader language
let tlist_hlsl_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function'
" add actionscript language
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'



" DISABLE: minibufexpl makes Vim editing slow when there are too many buffers opened
"          if you don't mind, and love this plugin, uncomment the script below
"          to enable it
" ex-minibufexpl
 "---------------------------------------------------
 Plugin 'exvim/ex-minibufexpl'
 let g:miniBufExplBuffersNeeded = 0 
 let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
 let g:miniBufExplMaxSize = 1 " <max lines: default 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
 let g:miniBufExplTabWrap = 1
"let g:miniBufExplorerAutoStart = 0

 " let g:miniBufExplDebugMode  = 3
 " let g:miniBufExplDebugLevel = 0

" DISABLE: use ex-autocomplpop instead
" " neocomplete: invoke when you insert words
 Plugin 'Shougo/neocomplete.vim'
" " ---------------------------------------------------

 let g:neocomplete#enable_at_startup = 1
 let g:neocomplete#enable_smart_case = 1
 let g:neocomplete#enable_auto_select = 1 " let neocomplete's completion behavior like AutoComplPop
" " Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" ex-showmarks: invoke by m... or <leader>mm, <leader>ma
" ---------------------------------------------------
Plugin 'exvim/ex-showmarks'

" TODO: bootleq/ShowMarks on github is well organized in code, but have lots
" bugs, consider merge his code and fixes the bugs
let g:showmarks_enable = 1
let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type = 'hqm' " Ignore help, quickfix, non-modifiable buffers
" Hilight lower & upper marks
let g:showmarks_hlline_lower = 1
let g:showmarks_hlline_upper = 0

" ex-visincr: invoke when select text and type ':II'
" ---------------------------------------------------
Plugin 'exvim/ex-visincr'

" ex-matchit: invoke by %
" ---------------------------------------------------
Plugin 'exvim/ex-matchit'


" searchcompl: invoke by /
" ---------------------------------------------------
Plugin 'exvim/ex-searchcompl'

" ex-colorschemes
" ---------------------------------------------------
Plugin '8427003/ex-colorschemes'

" vim-color-solarized
" ---------------------------------------------------
Plugin 'altercation/vim-colors-solarized'

" DISABLE: vim-airline makes Vim editing slow when there are too many buffers opened
"          if you don't mind, and love this plugin, uncomment the script below
"          to enable it
 "vim-airline
" ---------------------------------------------------
 Plugin 'bling/vim-airline'

 if has('gui_running')
     let g:airline_powerline_fonts = 1
 else
     let g:airline_powerline_fonts = 0
 endif

 let g:airline#extensions#tabline#enabled = 0 " NOTE: When you open lots of buffers and typing text, it is so slow.
 let g:airline#extensions#tabline#show_buffers = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1
 let g:airline#extensions#tabline#fnamemod = ':t'
" " let g:airline_section_b = "%{fnamemodify(bufname('%'),':p:.:h').'/'}"
" " let g:airline_section_c = '%t'
" " let g:airline_section_warning = airline#section#create(['whitespace']) " NOTE: airline#section#create has no effect in .vimrc initialize pahse
" " let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#whitespace#check(),0)}'
 let g:airline_section_warning = ''

" ctrlp: invoke by <ctrl-p>
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_match_window = 'bottom,order:ttb,min:30,max:30,results:30'
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_max_files = 0 " Unset cap of 10,000 files so we find everything
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
nnoremap <unique> <leader>bs :CtrlPBuffer<CR>
 let g:ctrlp_regexp = 1


" vim-fugitive: invoke most by :Gdiff
" ---------------------------------------------------
Plugin 'tpope/vim-fugitive'

" vim-surround: invoke when you select words and press 's'
" ---------------------------------------------------
Plugin 'tpope/vim-surround'

xmap s <Plug>VSurround

" DISABLE
" " Plugin 'tpope/vim-dispatch'
" " ---------------------------------------------------

" nerdtree: invoke by :NERDTreeToggle
" ---------------------------------------------------
Plugin 'scrooloose/nerdtree'

let g:NERDTreeWinSize = 30
let g:NERDTreeMouseMode = 1
let g:NERDTreeMapToggleZoom = '<Space>'
let g:NERDTreeMinimalUI=1 "不显示帮助面板
let g:NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号
autocmd vimenter * NERDTree "自动以当前目录打开tree
nmap nf :NERDTreeFind<CR>"锁定文件对应目录树位置
nmap <F3> :NERDTreeToggle<CR>

" nerdcommenter: invoke by <leader>c<space>, <leader>cl, <leader>cu, <F11> or <C-F11>
" ---------------------------------------------------
Plugin 'scrooloose/nerdcommenter'

" generate doc comment template
nmap tt :call GenerateDOCComment()<CR>

function! GenerateDOCComment()
  let l    = line('.')
  let i    = indent(l)
  let pre  = repeat(' ',i)
  let text = getline(l)
  let params   = matchstr(text,'([^)]*)')
  let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
  echomsg params
  let vars = []
  let m    = ' '
  let ml = matchlist(params,paramPat)
  while ml!=[]
    let [_,var;rest]= ml
    let vars += [pre.' * @param  {type} '.var]
    let ml = matchlist(rest,paramPat,0)
  endwhile
  let vars += [pre.' * @return {type} ']
  let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
  call append(l-1,comment)
  call cursor(l+1,i+3)
endfunction



let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDCustomDelimiters = {
            \ 'vimentry': { 'left': '--' },
            \ }
map <unique> <F11> <Plug>NERDCommenterAlignBoth
map <unique> <C-F11> <Plug>NERDCommenterUncomment

" syntastic: invoke when you save file and have syntac-checker
" ---------------------------------------------------
Plugin 'scrooloose/syntastic'

" this will make html file by Angular.js ignore errors
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]



" undotree: invoke by <Leader>u
" ---------------------------------------------------
Plugin 'mbbill/undotree'

nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout = 4

" NOTE: this will prevent undotree closed then jump to minibufexpl
function! g:CloseUndotree()
    call UndotreeHide()
    call ex#window#goto_edit_window()
endfunction

function g:Undotree_CustomMap()
    if has('gui_running')
        nnoremap <silent> <script> <buffer> <ESC> :call g:CloseUndotree()<CR>
    else
        nnoremap <silent> <script> <buffer> <leader><ESC> :call g:CloseUndotree()<CR>
    endif
endfunction

" tabular: invoke by <leader>= alignment-character
" ---------------------------------------------------
Plugin 'godlygeek/tabular'

nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:<CR>
vmap <Leader>: :Tabularize /:<CR>

" vim-easymotion: invoke by <leader><leader> w,b,e,ge,f,F,h,i,j,k,/
" ---------------------------------------------------
Plugin 'Lokaltog/vim-easymotion'

map ff <Plug>(easymotion-sn)
map <leader><leader>/ <Plug>(easymotion-sn)
omap <leader><leader>/ <Plug>(easymotion-tn)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" LargeFile
" ---------------------------------------------------
Plugin 'vim-scripts/LargeFile'
let g:LargeFile= 5 " files >= 5MB will use LargeFile rules

"}}}

" DISABLE: I'm using GistBox https://app.gistboxapp.com/ instead
" " gist-vim: Invoke by :Gist
" ---------------------------------------------------
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/gist-vim'

" c-lang {{{

" ex-cref: invoke by <leader>cr
" ---------------------------------------------------
Plugin 'exvim/ex-cref'

" this is modified for default c syntax highlight settings
" make it don't highlight error pattern
let c_gnu = 1
let c_no_curly_error = 1
let c_no_bracket_error = 1

"}}}

" web {{{

Plugin 'ntpeters/vim-better-whitespace'
nnoremap <unique> <leader>w :StripWhitespace<CR>

" ex-typescript
" ---------------------------------------------------
Plugin 'exvim/ex-typescript'

" emmet-vim
" ---------------------------------------------------
Plugin 'mattn/emmet-vim'

" make sure emmet only enable in html,css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vim-indent-guides: invoke by <leader>ig
" ---------------------------------------------------
Plugin 'nathanaelkane/vim-indent-guides'

let g:indent_guides_guide_size = 1

" vim-javascript
" ---------------------------------------------------
Plugin 'pangloss/vim-javascript'

" vim-coffee-script
" ---------------------------------------------------
Plugin 'kchmck/vim-coffee-script'

" vim-html
" ---------------------------------------------------
Plugin 'exvim/ex-indenthtml.vim'


" DISABLE: Slow to open big css file
" vim-css-color
" ---------------------------------------------------
" Plugin 'skammer/vim-css-color'

" vim-css3-syntax
Plugin 'hail2u/vim-css3-syntax'

" vim-less
" ---------------------------------------------------
Plugin 'groenewege/vim-less'

" vim-stylus
" ---------------------------------------------------
Plugin 'wavded/vim-stylus'

" vim-markdown
" ---------------------------------------------------
Plugin 'plasticboy/vim-markdown'

let g:vim_markdown_initial_foldlevel=9999

"}}}


"my add plugins
" ---------------------------------------------------
"Plugin 'roman/golden-ratio'
"打开文件目录
function! OpenWithExplorer()
    "let currentPath = expand("%:p:h")
    let currentFile = expand("%:p")
    call system("open".currentFile)
endfunction
command! -nargs=0 Ep call OpenWithExplorer()


Plugin 'vim-scripts/Conque-Shell'

let g:ConqueTerm_FastMode = 1 
let g:ConqueTerm_StartMessages = 0 

"template
Plugin '8427003/template.vim'

Plugin 'othree/xml.vim' "html closeTag is ok

"Plugin 'xolox/vim-misc' "vim-session require 
"Plugin 'xolox/vim-session' "重新打开以前打开的 
"let g:session_autoload = 'yes' "自动加载会话不提示
"let g:session_autosave = 'yes' "自动保存不提示

Plugin 'Raimondi/delimitMate' "() {} 括号匹配 is ok
let delimitMate_expand_cr = 1 "let -R indent
au FileType mail let b:delimitMate_expand_cr = 1
"inoremap <expr> <Tab> <C-Tab>


Plugin 'terryma/vim-expand-region'

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/nerdtree-ack'
Plugin 'mileszs/ack.vim'
Plugin 'dkprice/vim-easygrep'

"系统粘贴版
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"自动跳转到粘贴文本的最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"我经常复制一段内容，在 visual 模式下选中一段文本并粘贴来实现替换，
"此时“剪贴板”中的内容会被替换成被删掉的文本，如果想粘贴第二次就很不方便了。
"这个映射解决了这个问题。
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()


"//////////////////////////////////////////////////////////////////////////////
"my setting
"/////////////////////////////////////////////////////////////////////////////

":set cursorline
":set autochdir "自动设当前编辑的文件所在目录为当前工作路径 
":lcd %:p:h  "自动更改到当前文件所在的目录

colorscheme molokai 


function! OpenBash()
    let path = expand("%:p:h")
    let my_terminal = conque_term#open('bash')
    call conque_term#get_instance().writeln("cd ".path)
endfunction



" use English for anaything in vim-editor.
if WINDOWS()
    :cd C:\Users\cocoo.li\Desktop\git
elseif OSX()
    :cd ~/git
    nmap <Leader><Leader><Leader> :call OpenBash()<CR>
else
    :cd ~/git
endif


" TEST {{{
" " test-loading
" echomsg "test-loading: .vimrc"
" Plugin 'exvim/test-loading'
"}}}

" vim:ts=4:sw=4:sts=4 et fdm=marker:
