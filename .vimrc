"map <S-CR> <CR><CR>end<Esc>-cc

call pathogen#infect()
"call pathogen#infect("rsense")
"let g:rsenseHome = "~/bin/rsense/bin"
"let g:rsenseUseOmniFunc = 1

syntax on

filetype plugin indent on

colorscheme elflord

" Use different backup directory
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" 
" Tab Navigation
"
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>:e .<CR>
map td :tabclose<CR>

"
" Status line
"
set statusline=%<===\ %f%(\ ===\ %h%)%(\ ===\ %m%)%(\ ===\ %r%)\ %{fugitive#statusline()}\===%====\ %b(0x%B)\ ===\ %l,%c%V\ ===\ %P\ ===%0* laststatus=2

"set statusline=%<%1*===\ %5*%f%1*%(\ ===\ %4*%h%1*%)%(\ ===\ %4*%m%1*%)%(\ ===\ %4*%r%1*%)\ ===%====\ %2*%b(0x%B)%1*\ ===\ %3*%l,%c%V%1*\ ===\ %5*%P%1*\ ===%0* laststatus=2

" Include Line Numbers
set nu

" When pasting in text - don't try and format it
set pastetoggle=<F6>

" Better tab completion for command line
set wildmode=longest,list,full
set wildmenu

set tabstop=2
set shiftwidth=2
set expandtab
set cindent

set backspace=indent,eol,start

set linebreak

" various key mappings 
map <F2> :!g++ -o %:r %<cr>
map <F3> :w<cr>:!coffee %<cr>
map <S-F3> :w<cr>:!coffee -c %<cr>
map <F4> <Esc>:w<cr>:!ruby %<cr>
map <F5> :!clang++ -std=c++11 -stdlib=libc++ -o %:r %<cr>:!./%:r<cr>

" playing around with ruby end tokens
if !exists("*RubyEndToken")
  function RubyEndToken()
    let current_line = getline('.')
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
    let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

    if match(current_line, braces_at_end) >= 0
      return "\<CR>}\<C-O>O"
    elseif match(current_line, stuff_without_do) >= 0
      return "\<CR>end\<C-O>O"
    elseif match(current_line, with_do) >= 0
      return "\<CR>end\<C-O>O"
    else
      return "\<CR>"
    endif
  endfunction
endif

imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
