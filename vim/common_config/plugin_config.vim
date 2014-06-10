" Plugins are managed by Vundle. Once VIM is open run :NeoBundleInstall to
" install plugins.
filetype off

" Plugins requiring no additional configuration or keymaps
NeoBundle "ddollar/nerdcommenter"
NeoBundle "ervandew/supertab"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "tpope/vim-surround"
NeoBundle "kien/ctrlp.vim"
NeoBundle "christoomey/vim-tmux-navigator"
NeoBundle "squarefrog/tomorrow-night.vim"
NeoBundle "mattn/webapi-vim"
NeoBundle "mattn/gist-vim"

" Ruby
NeoBundle "vim-ruby/vim-ruby"

" Markdown
NeoBundle "tpope/vim-markdown"

" Coffee script
NeoBundle "kchmck/vim-coffee-script"

" iOS specific plugins
NeoBundle "Keithbsmiley/kiwi.vim"
NeoBundle "jerrymarino/xcodebuild.vim"
NeoBundle "b4winckler/vim-objc"
NeoBundle "vim-scripts/Match-Bracket-for-Objective-C"
NeoBundleLazy "toyamarinyon/vim-swift", { 'filetypes' : 'swift' }

NeoBundle "Rip-Rip/clang_complete"
  let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

" Arduino
NeoBundleLazy "jplaut/vim-arduino-ino", { 'filetypes' : ['ino', 'pde'] }
NeoBundleLazy "sudar/vim-arduino-syntax", { 'filetypes' : ['ino', 'pde'] }

NeoBundle "elzr/vim-json"
  let g:vim_json_syntax_conceal = 0
  set foldmethod=syntax

NeoBundle "scrooloose/nerdtree"
  let NERDTreeShowHidden=1
  nmap gt :NERDTreeToggle<CR>


NeoBundle "bling/vim-airline"
  let g:airline_theme             = 'tomorrow'
  let g:airline_enable_branch     = 1
  let g:airline_enable_syntastic  = 1
  let g:airline_powerline_fonts   = 1
  set encoding=utf-8
  set laststatus=2 " Force airline to show all the time
  set nocompatible " Disable vi-compatibility
  set t_Co=256 " Set colours for vim-airline
  set ttimeoutlen=50


NeoBundle "tpope/vim-fugitive"
  map <leader>gb :Gblame<CR>
  map <leader>gs :Gstatus<CR>
  map <leader>gd :Gdiff<CR>
  map <leader>gl :Glog<CR>
  map <leader>gc :Gcommit<CR>
  map <leader>gp :Git push<CR>
  map <leader>gw :Gwrite<CR>


NeoBundle "tpope/vim-rails"
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1

filetype plugin indent on
syntax on
colorscheme Tomorrow-Night   " Set color scheme
