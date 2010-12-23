"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EXPERIMENTAL CONFIG

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => See bottom for documentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""map!  
map!  
"
"" first the disabled features due to security concerns
"set modelines=0                  " no modelines [http://www.guninski.com/vim1.html]
"let g:secure_modelines_verbose=0 " securemodelines vimscript
"let g:secure_modelines_modelines = 15 " 15 available modelines
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible
syntax on			                  " Enable syntax hl
set number
set ruler                     	" show the line number on the bar
set more                      	" use more prompt
set autoread                  	" watch for file changes
set nohidden                  	" close the buffer when I close a tab (I use tabs more than buffers)
set noautowrite               	" don't automagically write on :next
set showmode                  	" show the mode all the time
set showcmd                   	" Show us the command we're typing
set expandtab                 	" expand tabs to spaces (except java, see autocmd below)
set ai			                    " auto/smart indent
set si
set smarttab                  	" tab and backspace are smart
set lbr
set wrap 			                  " Wrap lines                                        
set tabstop=2                 	" 4 spaces
set shiftwidth=2              	" shift width
set backspace=indent,eol,start  " backspace over all kinds of things
set showfulltag               	" show full completion tags
set noerrorbells              	" no error bells please
set linebreak                 	" wrap at 'breakat' instead of last char
set tw=500                    	" default textwidth is a max of 500
set cmdheight=2               	" command line two lines high
set undolevels=500            	" 500 undos
set updatecount=100           	" switch every 100 chars
set complete=.,w,b,u,U,t,i,d  	" do lots of scanning on tab completion
set ttyfast                   	" we have a fast terminal
filetype on                   	" Enable filetype detection
filetype indent on            	" Enable filetype-specific indenting
filetype plugin on            	" Enable filetype-specific plugins
compiler ruby                 	" Enable compiler support for ruby
set wildmode=longest:full     	" *wild* mode
set wildignore+=*.o,*~,.lo    	" ignore object files
set wildmenu                  	" menu has tab completion
let maplocalleader=','        	" all my shortcuts start with ,
set whichwrap+=<,>,h,l        	" backspaces and cursor keys wrap to
set magic                     	" Enable the magic
set visualbell t_vb=          	" Disable ALL bells
set matchpairs+=<:>          	" add < and > to match pairs
set tags=tags;/              	" search recursively up for tags
set tags=~/.vtags,tags        	" tag filenames
""""""""""""
set so=7			      " Set 7 lines to the cursors - when moving vertical..
set hid	 			      " Change buffer - without saving
set ignorecase  		"Ignore case when searching
set smartcase
set hlsearch 			  " Highlight search things
set incsearch 			" Make search act like search in modern browsers
set nolazyredraw 		" Don't redraw while executing macros 
set showmatch 			" Show matching bracets when text indicator is over them
set mat=2 			    " How many tenths of a second to blink

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700			" Sets how many lines of history VIM has to remember
filetype plugin on	" Enable filetype plugin
filetype indent on
set autoread			  " Set to auto read when a file is changed from the outside
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>

if MySys() == "windows"
    " Fast editing of the .vimrc
    map <leader>e :e! ~/_vim_runtime/vimrc<cr>

    " When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/_vim_runtime/vimrc
else
    " Fast editing of the .vimrc
    map <leader>e :e! ~/.vim_runtime/vimrc<cr>

    " When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if MySys() == "mac"
  set gfn=Monaco:h13.0 antialias
  set shell=/bin/bash
elseif MySys() == "windows"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif MySys() == "linux"
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

if has("gui_running")
  set mousehide             " Hide the mouse when typing text
  colorscheme rdark
  let rdark_current_line=1  " highlight current line
  set background=dark
  set number               " line numbers
  "set lazyredraw                " don't redraw when don't have to
  set scrolloff=3               " keep at least 3 lines above/below
  set sidescrolloff=5           " keep at least 5 lines left/right
  "set foldmethod=syntax         " fold on syntax automagically, always
  set foldcolumn=4              " 4 lines of column for fold showing, always
  set cursorline           " show the cursor line
  set guioptions-=T        " no toolbar
  set guioptions-=l        " no left scrollbar
  set guioptions-=L        " no left scrollbar
  set guioptions-=r        " no right scrollbar
  set guioptions-=R        " no right scrollbar
  set transparency=0
  set clipboard=unnamed
  set t_Co=256
else
  colorscheme zellner
  set background=dark
  set nonu
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif
    
    set undofile
catch
endtry

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" NOTICE: Really useful!

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

"
" From an idea by Michael Naumann
" 
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File = 1         " Only show tags for current buffer
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => configuration for fuzzyfinder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" find in buffer is ,b
nmap <LocalLeader>b :FuzzyFinderBuffer<CR>
" see: http://github.com/viperinthought/fuzzyfinder_textmate/
" FuzzyFinderTextMate is broken at the moment due to vim patches
"nmap <LocalLeader>f :FuzzyFinderTextMate<CR>
"nmap <LocalLeader>f :FuzzyFinderFile<CR>
" Switching to Command-T
nmap <LocalLeader>f :CommandT<CR>
" find in file is ,F
"nmap <LocalLeader>F :FuzzyFinderFile<CR>
nmap <LocalLeader>F :CommandT<CR>
" find in tag is ,t
nmap <LocalLeader>t :FuzzyFinderTag<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d c <C-\>eCurrentFileDir("e")<cr>
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Return to last edit position (You want this!) *N*
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Remeber open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), '/Users/jbowles/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 30
let g:miniBufExplSplitBelow=1

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on omni-completion for the appropriate file types.
" => Omni complete functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1  " Rails support
autocmd FileType java setlocal noexpandtab " don't expand tabs to spaces for Java
" put these lines in ~/.vim/.compiler_info
"au FileType ruby let b:{g:ctk_ext_var} = 'rb'
"au FileType ruby SetCompilerInfo ruby title='Ruby 1.9.1 - Matz' cmd='ruby $flags $input' run='ruby $input' flags='-wc' debug_flags='-rdebug $flags'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find words for spellcheck
set dictionary=/usr/share/dict/words " more words!

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
"""""""""""""""""""""""""""""""
"let python_highlight_all = 1
"au FileType python syn keyword pythonDecorator True None False self
"
"au BufNewFile,BufRead *.jinja set syntax=htmljinja
"au BufNewFile,BufRead *.mako set ft=mako
"
"au FileType python inoremap <buffer> $r return 
"au FileType python inoremap <buffer> $i import 
"au FileType python inoremap <buffer> $p print 
"au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
"au FileType python map <buffer> <leader>1 /class 
"au FileType python map <buffer> <leader>2 /def 
"au FileType python map <buffer> <leader>C ?class 
"au FileType python map <buffer> <leader>D ?def 
"

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>l :MRU<CR>


""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

if MySys() == "mac"
    if has("gui_running")
      set fuoptions=maxvert,maxhorz
      au GUIEnter * set fullscreen
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Another configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""map!  
"map!  
"" ---------------------------------------------------------------------------
"" first the disabled features due to security concerns
"set modelines=0                  " no modelines [http://www.guninski.com/vim1.html]
"let g:secure_modelines_verbose=0 " securemodelines vimscript
"let g:secure_modelines_modelines = 15 " 15 available modelines
"
"" ---------------------------------------------------------------------------
"" operational settings
"set nocompatible              " vim, not vi
"syntax on
"set ruler                     " show the line number on the bar
"set more                      " use more prompt
"set autoread                  " watch for file changes
"set nohidden                  " close the buffer when I close a tab (I use tabs more than buffers)
"set noautowrite               " don't automagically write on :next
"set showmode                  " show the mode all the time
"set showcmd                   " Show us the command we're typing
"set autoindent smartindent    " auto/smart indent
"set expandtab                 " expand tabs to spaces (except java, see autocmd below)
"set smarttab                  " tab and backspace are smart
"set tabstop=6                 " 6 spaces
"set shiftwidth=6              " shift width
"set backspace=indent,eol,start  " backspace over all kinds of things
"set showfulltag               " show full completion tags
"set noerrorbells              " no error bells please
"set linebreak                 " wrap at 'breakat' instead of last char
"set tw=500                    " default textwidth is a max of 500
"set cmdheight=2               " command line two lines high
"set undolevels=500            " 500 undos
"set updatecount=100           " switch every 100 chars
"set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
"set ttyfast                   " we have a fast terminal
"filetype on                   " Enable filetype detection
"filetype indent on            " Enable filetype-specific indenting
"filetype plugin on            " Enable filetype-specific plugins
"compiler ruby                 " Enable compiler support for ruby
"set wildmode=longest:full     " *wild* mode
"set wildignore+=*.o,*~,.lo    " ignore object files
"set wildmenu                  " menu has tab completion
"let maplocalleader=','        " all my shortcuts start with ,
"set whichwrap+=<,>,h,l        " backspaces and cursor keys wrap to
"set magic                     " Enable the magic
"set visualbell t_vb=          " Disable ALL bells
"set matchpairs+=<:>           " add < and > to match pairs
"set tags=tags;/               " search recursively up for tags
"set tags=~/.vtags,tags        " tag filenames
"
"" disable yankring for now
"let g:loaded_yankring = 1
"" disable paredit for now
"let g:paredit_mode = 0
"
"" Use 'par' (sudo port install par) to format paragraphs with a width of 80
"set formatprg=par\ -w80
"
"" Find words for spellcheck
"set dictionary=/usr/share/dict/words " more words!
"
"
"" Settings for NERD_Tree
let NERDTreeWinPos="left"
let NERDTreeWinSize=35
"
"" Settings for taglist.vim
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=0
"let Tlist_Enable_Fold_Column=0
"let Tlist_Show_One_File = 1         " Only show tags for current buffer
"let Tlist_Compact_Format=0
"let Tlist_WinWidth=28
"let Tlist_Exit_OnlyWindow=1
"let Tlist_File_Fold_Auto_Close = 1
"
"" Settings for :TOhtml
"let html_number_lines=1
"let html_use_css=1
"let use_xhtml=1
"
"" Settings for VimClojure
"let g:vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins
"let g:vimclojure#ParenRainbow=1        " Rainbow parentheses'!
"let g:vimclojure#DynamicHighlighting=1 " Dynamically highlight functions
"let vimclojure#NailgunClient="/Users/jbowles/bin/ng" " Nailgun location
"let vimclojure#WantNailgun=1
"let vimclojure#SplitPos = "right"
""let vimclojure#SplitSize = 15
""let g:clj_want_gorilla=1            " Bananas! (Make sure nailgun in is your path)
"
"" Settings for yankring
"let g:yankring_history_dir="/Users/jbowles/.vim/"
"let g:yankring_history_file="yank.txt"
"
"" Bindings for Narrow/Widen
map <LocalLeader>N :Narrow<cr>
map <LocalLeader>W :Widen<cr>
"
"" Bindings for ctk
"nnoremap <LocalLeader>C :CC<cr>
"" I don't like having xterm open.
"let g:ctk_execprg=''
"
"" PHP settings
"let php_sql_query=1
"let php_htmlInStrings=1
"let php_noShortTags=1
"let php_folding=1
"
"" Ri settings
"let ri_split_orientation='vertical'
"let ri_prompt_complete='on'
"
"" Supertab settings
"" supertab + eclim == java win
"let g:SuperTabDefaultCompletionType = "context"
"" Omni for vimclojure
"autocmd FileType clojure let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = [
"                  \ "&completefunc:<c-x><c-u>",
"                  \ "&omnifunc:<c-x><c-o>",
"                  \ ]
"let g:SuperTabLongestHighlight = 1
"
"" Gist.vim settings (http://www.vim.org/scripts/script.php?script_id=2423)
"let g:gist_open_browser_after_post = 1
"" Mac-specific
"let g:gist_browser_command = 'open %URL%'
"let g:gist_clip_command = 'pbcopy'
"
"" SimpleFold settings
"" This doesn't work yet.
"let g:clojure_simplefold_nestable_start_expr = '\v\(defn'
"let g:clojure_simplefold_nestable_end_expr = '\v^\s*$'
"
"" Remap up and down arrow in VimClojure REPL
""function CustomiseClojureRepl()
"  "if exists("b:vimclojure_repl")
"    "inoremap <buffer> <Up> <Plug>ClojureReplUpHistory
"    "inoremap <buffer> <Down> <Plug>ClojureReplDownHistory
"  "endif
""endfunction
""autocmd FileType clojure call CustomiseClojureRepl()
"
"" Showmarks settings
"let g:showmarks_ignore_type="hmprq"
"let g:showmarks_enable=0
"
"" Changes.vim settings
"let g:changes_autocmd=1      " Autoshow changes on cursorpause
"let g:changes_verbose=0      " Don't show what symbols mean
"
"" Eclim settings
"" ,i imports whatever is needed for current line
"nnoremap <silent> <LocalLeader>i :JavaImport<cr>
"" ,d opens javadoc for statement in browser
"nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
"" ,<enter> searches context for statement
"nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
"" ,jv validates current java file
"nnoremap <silent> <LocalLeader>jv :Validate<cr>
"" ,jc shows corrections for the current line of java
"nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
"" 'open' on OSX will open the url in the default browser without issue
"let g:EclimBrowser='open'
"" Disable Eclim's taglisttoo because I use the regular taglist plugin
""let g:taglisttoo_disabled = 1
"" Disable HTML & PHP validation
"let g:EclimHtmlValidate = 0
"let g:EclimPhpValidate = 0
"
"
"" ---------------------------------------------------------------------------
""  configuration for fuzzyfinder
"" find in buffer is ,b
"nmap <LocalLeader>b :FuzzyFinderBuffer<CR>
"" see: http://github.com/viperinthought/fuzzyfinder_textmate/
"" FuzzyFinderTextMate is broken at the moment due to vim patches
""nmap <LocalLeader>f :FuzzyFinderTextMate<CR>
""nmap <LocalLeader>f :FuzzyFinderFile<CR>
"" Switching to Command-T
"nmap <LocalLeader>f :CommandT<CR>
"" find in file is ,F
""nmap <LocalLeader>F :FuzzyFinderFile<CR>
"nmap <LocalLeader>F :CommandT<CR>
"" find in tag is ,t
"nmap <LocalLeader>t :FuzzyFinderTag<CR>
"
"
"
"" ---------------------------------------------------------------------------
""  configuration for localvimrc.vim
"" don't ask, just source
"let g:localvimrc_ask=0
"" only source a max of 2 files
"let g:localvimrc_count=2
"
"
"" ---------------------------------------------------------------------------
""  config for easytags
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags/'
""let g:easytags_file = '~/.vtags'
""" tag-related keybinds:
""" open tag in new tab
""map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
""" open tag in split with ,\
""map <LocalLeader>\ :split <CR>:exec("tag ".expand("<cword>"))<CR>
""" open tag in vsplit with ,]
""map <LocalLeader>] :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>
""
"
"
"" ---------------------------------------------------------------------------
""  Automagic Clojure folding on defn's and defmacro's
""
"function GetClojureFold()
"      if getline(v:lnum) =~ '^\s*(defn.*\s'
"            return ">1"
"      elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
"            return ">1"
"      elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
"            return ">1"
"      elseif getline(v:lnum) =~ '^\s*$'
"            let my_cljnum = v:lnum
"            let my_cljmax = line("$")
"
"            while (1)
"                  let my_cljnum = my_cljnum + 1
"                  if my_cljnum > my_cljmax
"                        return "<1"
"                  endif
"
"                  let my_cljdata = getline(my_cljnum)
"
"                  " If we match an empty line, stop folding
"                  if my_cljdata =~ '^$'
"                        return "<1"
"                  else
"                        return "="
"                  endif
"            endwhile
"      else
"            return "="
"      endif
"endfunction
"
"function TurnOnClojureFolding()
"      setlocal foldexpr=GetClojureFold()
"      setlocal foldmethod=expr
"      setlocal foldcolumn=2
"endfunction
"
"autocmd FileType clojure call TurnOnClojureFolding()
"
"
"
"" ---------------------------------------------------------------------------
"" status line 
"set laststatus=2
"if has('statusline')
"      " Status line detail: (from Rafael Garcia-Suarez)
"      " %f		file path
"      " %y		file type between braces (if defined)
"      " %([%R%M]%)	read-only, modified and modifiable flags between braces
"      " %{'!'[&ff=='default_file_format']}
"      "			shows a '!' if the file format is not the platform
"      "			default
"      " %{'$'[!&list]}	shows a '*' if in list mode
"      " %{'~'[&pm=='']}	shows a '~' if in patchmode
"      " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
"      "			only for debug : display the current syntax item name
"      " %=		right-align following items
"      " #%n		buffer number
"      " %l/%L,%c%V	line number, total number of lines, and column number
"
"      function! SetStatusLineStyle()
"            "let &stl="%f %y "                       .
"            "\"%([%R%M]%)"                   .
"            "\"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
"            "\"%{'$'[!&list]}"               .
"            "\"%{'~'[&pm=='']}"              .
"            "\"%="                           .
"            "\"#%n %l/%L,%c%V "              .
"            "\""
"            "      \"%#StatusLineNC#%{GitBranchInfoString()}%* " .
"            let &stl="%F%m%r%h%w\ [%{&ff}]\ [%Y]\ %P\ %=[a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]"
"      endfunc
"      " Not using it at the moment, using a different one
"      call SetStatusLineStyle()
"
"      if has('title')
"            set titlestring=%t%(\ [%R%M]%)
"      endif
"
"      "highlight StatusLine    ctermfg=White ctermbg=DarkBlue cterm=bold
"      "highlight StatusLineNC  ctermfg=White ctermbg=DarkBlue cterm=NONE
"endif
"
"" ---------------------------------------------------------------------------
""  searching
"set incsearch                 " incremental search
"set ignorecase                " search ignoring case
"set smartcase                 " Ignore case when searching lowercase
"set hlsearch                  " highlight the search
"set showmatch                 " show matching bracket
"set diffopt=filler,iwhite     " ignore all whitespace and sync
"
"" ---------------------------------------------------------------------------
""  backup options
"set backup
"set backupdir=~/.backup
"set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set history=200
""set viminfo='100,f1
"
"" ---------------------------------------------------------------------------
"" spelling...
"if v:version >= 700
"
"      setlocal spell spelllang=en
"      nmap <LocalLeader>ss :set spell!<CR>
"
"endif
"" default to no spelling
"set nospell
"
"" ---------------------------------------------------------------------------
"" Turn on omni-completion for the appropriate file types.
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1  " Rails support
"autocmd FileType java setlocal noexpandtab " don't expand tabs to spaces for Java
"" put these lines in ~/.vim/.compiler_info
""au FileType ruby let b:{g:ctk_ext_var} = 'rb'
""au FileType ruby SetCompilerInfo ruby title='Ruby 1.9.1 - Matz' cmd='ruby $flags $input' run='ruby $input' flags='-wc' debug_flags='-rdebug $flags'
"
"" I want Ri access *all* the time.
""source ~/.vim/ftplugin/ri.vim
"
""-------------------------------------------------------------------------------
"" autocomplete parenthesis, brackets and braces
""-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
""
"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%
""
""-------------------------------------------------------------------------------
"" autocomplete quotes (visual and select mode)
""-------------------------------------------------------------------------------
"xnoremap  '  s''<Esc>P<Right>
"xnoremap  "  s""<Esc>P<Right>
"xnoremap  `  s``<Esc>P<Right>
"
"" ---------------------------------------------------------------------------
"" some useful mappings
"" Omnicomplete as Ctrl+Space
"inoremap <Nul> <C-x><C-o>
"" Also map user-defined omnicompletion as Ctrl+k
"inoremap <C-k> <C-x><C-u>
"" Y yanks from cursor to $
"map Y y$
"" for yankring to work with previous mapping:
"function! YRRunAfterMaps()
"      nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
"endfunction
"" toggle list mode
"nmap <LocalLeader>tl :set list!<cr>
"" Use the same symbols as TextMate for tabstops and EOLs
""set listchars=tab:‚ñ∏\ ,eol:¬¨,trail:-
"set listchars=eol:\ ,tab:¬ª-,trail:¬∑,precedes:‚Ä¶,extends:‚Ä¶,nbsp:‚Äó
"" toggle paste mode
"nmap <LocalLeader>pp :set paste!<cr>
"" toggle wrapping
"nmap <LocalLeader>ww :set wrap!<cr>
"" change directory to that of current file
"nmap <LocalLeader>cd :cd%:p:h<cr>
"" change local directory to that of current file
"nmap <LocalLeader>lcd :lcd%:p:h<cr>
"" correct type-o's on exit
"nmap q: :q
"" save and build
"nmap <LocalLeader>wm  :w<cr>:make<cr>
"" open all folds
"nmap <LocalLeader>o  :%foldopen!<cr>
"" close all folds
"nmap <LocalLeader>c  :%foldclose!<cr>
"" ,tt will toggle taglist on and off
"nmap <LocalLeader>tt :Tlist<cr>
"" ,n will toggle NERDTree on and off
"nmap <LocalLeader>n :NERDTreeToggle<cr>
"" When I'm pretty sure that the first suggestion is correct
"map <LocalLeader>st 1z=
"" q: sucks
"nmap q: :q
"" If I forgot to sudo vim a file, do that with :w!!
"cmap w!! %!sudo tee > /dev/null %
"" Fix the # at the start of the line
"inoremap # X<BS>#
"" When I forget I'm in Insert mode, how often do you type 'jj' anyway?:
"imap jj <Esc>
"" Fold with paren begin/end matching
"nmap F zf%
"" When I use ,sf - return to syntax folding with a big foldcolumn
"nmap <LocalLeader>sf :set foldcolumn=6 foldmethod=syntax<cr>
"" GPG helpers
"nmap <LocalLeader>E :1,$!gpg --armor --encrypt 2>/dev/null<CR>
"nmap <LocalLeader>ES :1,$!gpg --armor --encrypt --sign 2>/dev/null<CR>
"nmap <LocalLeader>S :1,$!gpg --clearsign 2>/dev/null<CR>
"" ruby helpers
"iab rbang #!/usr/bin/env ruby -w<cr> encoding: UTF-8<cr>
"" For mac users (using the 'apple' key)
""map <D-S-]> gt " MacVim already does this
""map <D-S-[> gT " MacVim already does this
"map <D-1> 1gt
"map <D-2> 2gt
"map <D-3> 3gt
"map <D-4> 4gt
"map <D-5> 5gt
"map <D-6> 6gt
"map <D-7> 7gt
"map <D-8> 8gt
"map <D-9> 9gt
"map <D-0> :tablast<CR>
"
"map <C-p> :tabprev<CR>
"map <C-n> :tabnext<CR>
"
"" Switch tabs with ctrl-tab and ctrl-shift-tab like most browsers
"map <C-Tab> gt
"map <C-S-Tab> gT 
" 
"" Command + movement for wrapped lines.
"vmap <D-j> gj
"vmap <D-k> gk
""vmap <D-4> g$
"vmap <D-6> g^
"vmap <D-0> g^
"
"" Vimperator-like bindings for a tab switches.
"nmap b1 1gt
"nmap b2 2gt
"nmap b3 3gt
"nmap b4 4gt
"nmap b5 5gt
"nmap b6 6gt
"nmap b7 7gt
"nmap b8 8gt
"nmap b9 9gt
"
"" Compile Ruby code after writing (show warnings/errors)
"function! Compile()
"  " don't compile if it's an Rspec file (extra warnings)
"  let name = expand('<afile>')
"  if name !~ 'spec'
"    CC
"  endif
"endfunction
"autocmd BufWritePost *.rb call Compile()
"
"" Diff with saved version of the file
"function! s:DiffWithSaved()
"  let filetype=&ft
"  diffthis
"  vnew | r # | normal! 1Gdd
"  diffthis
"  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
"endfunction
"com! DiffSaved call s:DiffWithSaved()
"
"
"" ---------------------------------------------------------------------------
""  xmpfilter ruby stuff
""  `gem install rcodetools`
"
"" Remove the '# => ' lines that xmpfilter adds
"function! RemoveRubyEval() range
"  let begv = a:firstline
"  let endv = a:lastline
"  normal Hmt
"  set lz
"  execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
"  normal 'tzt`s
"  set nolz
"  redraw
"endfunction
"
"" Add # => markers
"" ,m for "Add mark"
"vmap <silent> <LocalLeader>m !xmpfilter -m<cr>
"nmap <silent> <LocalLeader>m V<LocalLeader>e
"
"" Remove # => markers
"" ,r for "Remove mark"
"vmap <silent> <LocalLeader>r ms:call RemoveRubyEval()<CR>
"nmap <silent> <LocalLeader>r V<LocalLeader>r
"
"" plain annotations
"" ,e for "Eval marks"
"map <silent> <LocalLeader>e !xmpfilter -a<cr>
"nmap <silent> <LocalLeader>e V<LocalLeader>e
"
"" Test::Unit assertions; use -s to generate RSpec expectations instead
"" ,s for "Spec generation"
"map <silent> <LocalLeader>s !xmpfilter -s<cr>
"nmap <silent> <LocalLeader>s V<LocalLeader>s
"
"" Annotate the full buffer
"" I actually prefer ggVG to %; it's a sort of poor man's visual bell 
"" ,fe for "Full Eval"
"nmap <silent> <LocalLeader>Fe mzggVG!xmpfilter -a<cr>'z
"
"" assertions
"nmap <silent> <S-F11> mzggVG!xmpfilter -u<cr>'z
"
"" Ack helpers
"" replaced by this vimscript: http://www.vim.org/scripts/script.php?script_id=2572
"" ---------------------------------------------------------------------------
"" tabs
"" (LocalLeader is ",")
"map <LocalLeader>tc :tabnew %<cr>    " create a new tab       
"map <LocalLeader>td :tabclose<cr>    " close a tab
"map <LocalLeader>tn :tabnext<cr>     " next tab
"map <silent><m-Right> :tabnext<cr>           " next tab
"map <LocalLeader>tp :tabprev<cr>     " previous tab
"map <silent><m-Left> :tabprev<cr>            " previous tab
"map <LocalLeader>tm :tabmove         " move a tab to a new location
"
"" ---------------------------------------------------------------------------
"" auto load extensions for different file types
"if has('autocmd')
"      filetype plugin indent on
"      syntax on
"
"      " jump to last line edited in a given file (based on .viminfo)
"      "autocmd BufReadPost *
"      "       \ if !&diff && line("'\"") > 0 && line("'\"") <= line("$") |
"      "       \       exe "normal g`\"" |
"      "       \ endif
"      autocmd BufReadPost *
"                        \ if line("'\"") > 0|
"                        \       if line("'\"") <= line("$")|
"                        \               exe("norm '\"")|
"                        \       else|
"                        \               exe "norm $"|
"                        \       endif|
"                        \ endif
"
"      " improve legibility
"      au BufRead quickfix setlocal nobuflisted wrap number
"
"      " configure various extensions
"      let git_diff_spawn_mode=2
"
"      " improved formatting for markdown
"      " http://plasticboy.com/markdown-vim-mode/
"      autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
"endif
"
"
"===================================================================================
"         FILE:  .gvimrc
"  DESCRIPTION:  suggestion for a personal configuration file ~/.gvimrc
"       AUTHOR:  Dr.-Ing. Fritz Mehner
"      VERSION:  1.0
"      CREATED:  04.04.2009
"     REVISION:  $Id: customization.gvimrc,v 1.3 2009/04/04 08:26:21 mehner Exp $
"===================================================================================
" Used in .gvimrc
"===================================================================================
" GENERAL SETTINGS
"===================================================================================
"set cmdheight=2                                 " Make command line two lines high
"set mousehide                                   " Hide the mouse when typing text
"
"colorscheme rdark
"let rdark_current_line=1  " highlight current line
"set background=dark
"set number               " line numbers
"set lazyredraw                " don't redraw when don't have to
"set scrolloff=3               " keep at least 3 lines above/below
"set sidescrolloff=5           " keep at least 5 lines left/right
""set foldmethod=syntax         " fold on syntax automagically, always
"set foldcolumn=4              " 4 lines of column for fold showing, always
""set nonumber            " trying out no line numbers
""set noantialias         " no anti-alias
"set cursorline           " show the cursor line
"set guioptions-=T        " no toolbar
"set guioptions-=l        " no left scrollbar
"set guioptions-=L        " no left scrollbar
"set guioptions-=r        " no right scrollbar
"set guioptions-=R        " no right scrollbar
"set lines=66
"set columns=135
"set transparency=0
"set gfn=Monaco:h10.0 antialias
"set clipboard=unnamed
"
"function Fullscreen()
"      set lines=69
"      set columns=239
" endfunction
"
"function Restorescreen()
"      set lines=66
"      set columns=135
"endfunction
"
"if exists('&t_SI')
"      let &t_SI = "\<Esc>]12;lightgoldenrod\x7"
"      let &t_EI = "\<Esc>]12;grey80\x7"
"endif
"
"" highlight over 80 columns
""highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"highlight OverLength cterm=reverse
"match OverLength /\%81v.*/
""highlight Normal   guibg=grey9
""highlight Cursor   guibg=Blue   guifg=NONE
"highlight lCursor  guibg=Cyan   guifg=NONE
""highlight NonText  guibg=grey80
""highlight Constant gui=NONE     guibg=grey95
""highlight Special  gui=NONE     guibg=grey95
"
"" ---------------------------------------------------------------------------
"" setup for the visual environment
"if $TERM =~ '^xterm'
"      set t_Co=256 
"elseif $TERM =~ '^screen-bce'
"      set t_Co=256            " just guessing
"elseif $TERM =~ '^rxvt'
"      set t_Co=88
"elseif $TERM =~ '^linux'
"      set t_Co=8
"else
"      set t_Co=16
"endif
"" ---------------------------------------------------------------------------
"
"let c_comment_strings=1   " highlight strings inside C comments
""
""-------------------------------------------------------------------------------
"" Moving cursor to other windows
"" 
"" shift down   : change window focus to lower one (cyclic)
"" shift up     : change window focus to upper one (cyclic)
"" shift left   : change window focus to one on left
"" shift right  : change window focus to one on right
""-------------------------------------------------------------------------------
"nmap <s-down>   <c-w>w
"nmap <s-up>     <c-w>W
"nmap <s-left>   <c-w>h
"nmap <s-right>  <c-w>l
""
""-------------------------------------------------------------------------------
""  some additional hot keys
""-------------------------------------------------------------------------------
""   S-F3  -  call gvim file browser
""-------------------------------------------------------------------------------
" map  <silent> <s-F3>       :silent browse confirm e<CR>
"imap  <silent> <s-F3>  <Esc>:silent browse confirm e<CR>
""
""-------------------------------------------------------------------------------
"" toggle insert mode <--> 'normal mode with the <RightMouse>-key
""-------------------------------------------------------------------------------
""
"nmap	<RightMouse> <Insert>
"imap	<RightMouse> <ESC>
""
""-------------------------------------------------------------------------------
"" use font with clearly distinguishable brackets : ()[]{}
""-------------------------------------------------------------------------------
"set guifont=Luxi\ Mono\ 14
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: amix the lucky stiff
"             http://amix.dk - amix@amix.dk
"
" Version: 3.6 - 25/08/10 14:40:30
"
" Blog_post: 
"       http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" How_to_Install_on_Unix:
"    $ mkdir ~/.vim_runtime
"    $ svn co svn://orangoo.com/vim ~/.vim_runtime
"    $ cat ~/.vim_runtime/install.sh
"    $ sh ~/.vim_runtime/install.sh <system>
"      <sytem> can be `mac`, `linux` or `windows`
"
" How_to_Upgrade:
"    $ svn update ~/.vim_runtime
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> Python section
"    -> JavaScript section
"
"
" Plugins_Included:
"     > minibufexpl.vim - http://www.vim.org/scripts/script.php?script_id=159
"       Makes it easy to get an overview of buffers:
"           info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
" 
"     > bufexplorer - http://www.vim.org/scripts/script.php?script_id=42
"       Makes it easy to switch between buffers:
"           info -> :help bufExplorer
"
"     > yankring.vim - http://www.vim.org/scripts/script.php?script_id=1234
"       Emacs's killring, useful when using the clipboard:
"           info -> :help yankring
"
"     > surround.vim - http://www.vim.org/scripts/script.php?script_id=1697
"       Makes it easy to work with surrounding text:
"           info -> :help surround
"
"     > snipMate.vim - http://www.vim.org/scripts/script.php?script_id=2540
"       Snippets for many languages (similar to TextMate's):
"           info -> :help snipMate
"
"     > mru.vim - http://www.vim.org/scripts/script.php?script_id=521
"       Plugin to manage Most Recently Used (MRU) files:
"           info -> :e ~/.vim_runtime/plugin/mru.vim
"
"     > Command-T - http://www.vim.org/scripts/script.php?script_id=3025
"       Command-T plug-in provides an extremely fast, intuitive mechanism for opening filesa:
"           info -> :help CommandT
"           screencast and web-help -> http://amix.dk/blog/post/19501
"
"
"  Revisions:
"     > 3.6: Added lots of stuff (colors, Command-T, Vim 7.3 persistent undo etc.)
"     > 3.5: Paste mode is now shown in status line  if you are in paste mode
"     > 3.4: Added mru.vim
"     > 3.3: Added syntax highlighting for Mako mako.vim 
"     > 3.2: Turned on python_highlight_all for better syntax
"            highlighting for Python
"     > 3.1: Added revisions ;) and bufexplorer.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



