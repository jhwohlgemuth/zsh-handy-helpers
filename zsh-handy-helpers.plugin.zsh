#!/usr/bin/env zsh
#
# Aliases
#
alias rf="rm -frd"
#
# Functions
#
clean() {
    rf $1 && take $1 ;
}
create_ssh_key() {
    KEY_NAME=${2:-id_rsa}
    echo -n "Generating key pair......"
    ssh-keygen -q -b 4096 -t rsa -N "" -f ~/.ssh/"${KEY_NAME}"
    echo "DONE"
    if [[ -e ~/.ssh/"${KEY_NAME}".pub ]]; then
        if type xclip >/dev/null 2>&1; then
            cat ~/.ssh/"${KEY_NAME}".pub | xclip -sel clip
            echo "✔ Public key has been saved to clipboard"
        else
            cat ~/.ssh/"${KEY_NAME}".pub
        fi
    else
        echo "Something went wrong, please try again."
    fi
}
did() {
    echo -e "[${2:-"---"}] $(timestamp) / ${1}\n" >> "$HOME"/did.txt ;
}
dip() {
    if type docker >/dev/null 2>&1; then
        docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1 ;
    else
        echo "Please install Docker first"
    fi
}
dra() {
    if type docker >/dev/null 2>&1; then
        docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) ;
    else
        echo "Please install Docker first"
    fi
}
fix_ssh_key_permissions() {
    chmod 600 "${HOME}"/.ssh/config
}
fix_enospc_issue() {
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p >/dev/null 2>&1
}
iter() {
    if [[ -f "$2" ]]; then
        while read line; do
            $1 "$line"
        done < "$2"
    else
        while read ITEM; do
            $1 "$ITEM"
        done
    fi
}
prevent_user() {
    if [[ "$1" == $(whoami) ]]; then
        echo "✘ ${2} should NOT be run as ${1}"
        exit 0
    fi
}
prevent_root() {
    prevent_user root "$1"
}
qr() {
    echo "$1" | curl -F-=\<- qrenco.de ;
}
timestamp() {
    date +%Y%m%d-%T ;
}
