
#custom C compile flags
alias mycc='gcc -Werror -Wall -pedantic -std=c11'

#custom C++ compile flags
alias mycpp='g++ -std=c++17 -pedantic-errors -Wall -Werror -Weffc++ -Wextra -Wsign-conversion'

# specifying stk-simply for stk
alias stk='stk-simply'

# config shortcut for dotfiles repo
alias config='/usr/bin/git --git-dir=/home/nath/.cfg/ --work-tree=/home/nath'


# flags for testing output
alias pytest='python3 -m pytest --tb=short -v --no-header'
