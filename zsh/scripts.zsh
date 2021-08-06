#!/bin/zsh

compress() {
    tar cvzf $1.tar.gz $1
}

ftmuxp() {
    if [[ -n $TMUX ]]; then
        return
    fi

    # get the ids
    ID="$(ls $XDG_CONFIG_HOME/tmuxp | sed -E 's/\.yml|\.yaml$//')"
    if [[ -z "$ID" ]]; then
        tmux new-session
    fi

    create_new_session="create new session"

    ID="${create_new_session}\n$ID"
    ID="$(echo $ID | fzf | cut -d: -f1)"

    if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "$ID" ]]; then
        # rename the current urxvt tab to session name
        printf '\033]777;tabbedx:set_tab_name;%s\007' "$ID"
        tmuxp load "$ID"
    fi
}
