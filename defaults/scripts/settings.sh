#!/usr/bin/env bash

if [[ -z "${DECKY_PLUGIN_DIR}" ]]; then
    export DECKY_PLUGIN_DIR="$PWD"
fi

if [[ -z "${DECKY_PLUGIN_RUNTIME_DIR}" ]]; then
    DECKY_PLUGIN_RUNTIME_DIR="$(realpath "$PWD/../../data/Junk-Store")"
    export DECKY_PLUGIN_RUNTIME_DIR
fi

if [[ -z "${DECKY_PLUGIN_LOG_DIR}" ]]; then
    DECKY_PLUGIN_LOG_DIR="$(realpath "$PWD/../../logs/Junk-Store")"
    export DECKY_PLUGIN_LOG_DIR
fi

Extensions="Extensions"
