" Git
autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG                set ft=gitcommit | set spell
autocmd BufNewFile,BufRead *.git/config,.gitconfig,.gitmodules set ft=gitconfig
autocmd BufNewFile,BufRead git-rebase-todo                     set ft=gitrebase
autocmd BufNewFile,BufRead [0-9]*.patch
      \ if getline(1) =~ '^From.*$' |
      \   set ft=gitsendemail       |
      \   set spell                 |
      \ endif
autocmd BufNewFile,BufRead *.git/**
      \ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
      \   set ft=git                           |
      \ endif

" This logic really belongs in scripts.vim
autocmd BufNewFile,BufRead,StdinReadPost *
      \ if getline(1) =~ '^\(commit\|tree\|object\) \x\{40\}\>\|^tag \S\+$' |
      \   set ft=git |
      \ endif
