# ALIASES

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -la"
alias zshconfig="nvim $ZDOTDIR/.zshrc"
alias cdf='selected_path=$(rg --files --no-ignore-vcs | fzf) && [ -n "$selected_path" ] && cd "$(echo "$selected_path" | sed "s,/[^/]*$,," )"'

#alias gdbaarch='gdb-multiarch -ex "set architecture aarch64" -ex "target remote localhost:1234" --ex "dashboard registers -style list '\''x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 sp pc cpsr'\''"'
#alias qemuaarch='qemu-system-aarch64 -s -S -machine virt -cpu cortex-a53 -machine type=virt -nographic -smp 1 -m 64 -kernel kernel.img'
#alias nixos="qemu-system-x86_64 -m 2G -smp 2 --enable-kvm -name "nixos" -boot d -hda hddnixos.qcow2"
#alias condazsh='eval "$(/home/gregovilardo/anaconda3/bin/conda shell.zsh hook)"'
alias bat="batcat"
alias wget'=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias adb='HOME=/home/gregovilardo/.local/share/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
