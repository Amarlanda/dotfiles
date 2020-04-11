    set runtimepath^=~/.vim runtimepath+=~/.vim/after
set t_Co=256

    call plug#begin('~/local/share/nvim/plugged')


"Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
    "    #Plug 'deoplete-plugins/deoplete-jedi'
     "   #Plug 'mhartington/oceanic-next'
     "   #Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'

" dims background for inactive windows (makes it light)"
"Plug 'blueyed/vim-diminactive' -> crap but works
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

    call plug#end()
" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------


    "Plug 'junegunn/goyo.vim'
    " Gruvbox theme.
"Plug 'morhetz/gruvbox'
"colorscheme gruvbox

" For Gruvbox to look correct in terminal Vim you'll want to source a palette
" script that comes with the Gruvbox plugin.
"
" Add this to your ~/.profile file:
"   source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

" Gruvbox comes with both a dark and light theme.
set background=dark

" Gruvbox has 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_light='hard'

" This needs to come last, otherwise the colors aren't correct.
syntax on

if (&background == 'dark')
  " Fix the disgusting visual selection colors of gruvbox (thanks @romainl).
  hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a

  " Set a custom highlight color when yanking text.
  "   This requires having the plugin: machakann/vim-highlightedyank
  hi HighlightedyankRegion cterm=NONE ctermbg=239 guibg=#4e4e4e
else
  hi Visual cterm=NONE ctermfg=NONE ctermbg=223 guibg=#ffd7af
  hi HighlightedyankRegion cterm=NONE ctermbg=228 guibg=ffff87
endif

let g:gruvbox_color_column = 'aqua'

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

set number relativenumber

    let &packpath=&runtimepath
    source ~/.vimrc
  " enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" -----------------------------------------------------------------------------
"windows highlight setting "
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
" Background colors for active vs inactive windows
hi ActiveWindow guibg=#17252c
hi InactiveWindow guibg=#0D1B22

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

let g:airline_solarized_bg='dark'