#!/usr/bin/env bash
# utils/check-env.sh


# Sets the EDITOR-variable based on
# Termux or desktop Linux environment

if [[ -n "$TERMUX_VERSION" ]]; then
    ENVIRONMENT="Termux"
    EDITOR="vim"
else
    ENVIRONMENT="Linux_Desktop"
    EDITOR="gvim"
fi

# Fallback if editor is not found
if ! command -v "$EDITOR" &>/dev/null; then
    echo "Error: $EDITOR not found, falling back to vim" >&2
    EDITOR="vim"
fi

export ENVIRONMENT
export EDITOR


# Sets SyncThing directory-location

if [[ -n "$TERMUX_VERSION" ]]; then
    SYNCTHING_DIR="/storage/emulated/0/SyncThing"
    # SYNCTHING_DIR="~/storage/shared/SyncThing"
    # SYNCTHING_DIR="$HOME/storage/shared/SyncThing"
else
    # SYNCTHING_DIR="~/SyncThing"
    SYNCTHING_DIR="$HOME/SyncThing"
fi

export SYNCTHING_DIR

