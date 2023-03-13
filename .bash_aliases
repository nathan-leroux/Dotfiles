# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# clear alias
alias cl='clear'

# Custom C++ compile flags
alias mycpp='g++ -std=c++17 -pedantic-errors -Wall -Werror -Weffc++ -Wextra -Wsign-conversion'

# Custom CC compile flags
alias mycc='gcc -Werror -Wall -pedantic -std=c11'

# specifying stk-simply for stk
alias stk='stk-simply'

# config shortcut for dotfiles repo
alias config='/usr/bin/git --git-dir=/home/nath/.cfg/ --work-tree=/home/nath'

# pytest flags setup
alias pytest='python3 -m pytest -v --no-header --tb=short'

# misc. shortcuts
alias warp='source env/bin/activate'
