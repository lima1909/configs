# empty greeting message
set -U fish_greeting

fzf --fish | source

fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/configs/scripts
fish_add_path -g ~/tools
fish_add_path -g ~/tools/zig

set -U fish_color_command yellow
set -g fish_prompt_pwd_dir_length 10

alias vi='nvim'
alias ll='ls -la'
# alias ll='exa -la'
# alias ls='exa'
alias jl='just l'
alias wl='cd /mnt/c/workspace/rust_projects/lookups/'
alias lg='lazygit'
alias wr='cd /mnt/c/workspace/resty.nvim'
alias vr='nvim --cmd "set rtp+=." $(fzf)'
alias gb='git branch  | fzf --bind "enter:become(git switch {1})"'
alias k='~/configs/scripts/kill-list'
alias s='~/configs/scripts/switch_branch'

function runtests -d "run resty nvim tests"
        wr
        nvim --headless --noplugin -u spec/minimal_init.lua -c "PlenaryBustedDirectory spec/ {sequential = true, minimal_init = 'spec/minimal_init.lua'}"

        if test $status -eq 0
                set result '✔ '
        else
                set result (set_color red) $status 'х' (set_color normal)
        end

        echo '=> result: ' $result
        echo ' '

        # cd -
end

# fish_key_reader
# navigate back and forward in directories: nextd and prevd
bind \e\[1\;5C nextd-or-forward-word
bind \e\[1\;5D prevd-or-backward-word

# set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_showupstream 1
# set -g __fish_git_prompt_char_stateseparator ' | '
# set __fish_git_prompt_color green
# set __fish_git_prompt_showcolorhints blue
# set __fish_git_prompt_color_dirtystate yellow


# function fish_prompt -d "Write out the prompt"
#
#     if not test $status -eq 0
#       set result (set_color red) ' > '
#     else
#       set result (set_color green) ' > '
#     end
#
#     printf '%s%s%s %s\n%s' \
        #         (set_color blue) (prompt_pwd) (set_color normal) \
        #       (fish_git_prompt) $result
#
# end

# function fish_right_prompt -d "Write out the right prompt"
#         #    date '+%m/%d/%y'
#      if not test $status -eq 0
#        set result (set_color red) $status 'х' (set_color normal)
#      else
#        set result '✔ '
#      end
#
#      set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
#
#      printf '%s ms | %s' $duration (date +%H:%M)
# end
