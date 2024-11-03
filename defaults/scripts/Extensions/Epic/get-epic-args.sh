#!/usr/bin/env bash
PLATFORM=Epic
export DECKY_PLUGIN_DIR="$PWD"
export DECKY_PLUGIN_RUNTIME_DIR="$(realpath "$PWD/../../data/Junk-Store")"
export DECKY_PLUGIN_LOG_DIR="$(realpath "$PWD/../../logs/Junk-Store")"
if which legendary >/dev/null 2>&1; then
    export LEGENDARY=legendary
else
    export LEGENDARY="/bin/flatpak run com.github.derrod.legendary"
fi

export PYTHONPATH="${DECKY_PLUGIN_DIR}/scripts/":"${DECKY_PLUGIN_DIR}/scripts/shared/":$PYTHONPATH

export WORKING_DIR=$DECKY_PLUGIN_DIR

source "${DECKY_PLUGIN_DIR}/scripts/Extensions/Epic/settings.sh"

ARGS=$($EPICCONF --get-args "${1}" $OFFLINE_MODE --dbfile $DBFILE)
echo $ARGS
