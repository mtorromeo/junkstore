#!/usr/bin/env bash

function uninstall() {
    echo "Uninstalling flatpaks"
    if flatpak list | grep -q "com.github.derrod.legendary"; then
        echo "legendary flatpak is installed, removing"
        flatpak --user uninstall com.github.derrod.legendary -y
    fi
    if flatpak list | grep -q "com.github.Matoking.protontricks"; then
        echo "protontricks flatpak is installed, removing"
        flatpak --user uninstall com.github.Matoking.protontricks -y
    fi
    echo "Removing unused flatpaks"
    flatpak uninstall --user --unused -y
}

function download_and_install() {
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    if ! which protontricks >/dev/null; then
        flatpak install --user -y flathub org.gnome.Platform//45
        flatpak install --user -y com.github.Matoking.protontricks
    fi
    if ! which legendary >/dev/null 2>&1; then
        wget -qO /tmp/legendary.flatpak https://github.com/ebenbruyns/legendary-flatpak/releases/latest/download/legendary.flatpak
        flatpak install --user -y /tmp/legendary.flatpak
        rm /tmp/legendary.flatpak
    fi
}

function install() {
    if ! which legendary >/dev/null 2>&1 && flatpak list | grep -q "com.github.derrod.legendary"; then
        echo "legendary flatpak is installed, removing and reinstalling"
        flatpak uninstall --user -y com.github.derrod.legendary
    fi
    download_and_install
}

if [ "$1" == "uninstall" ]; then
    echo "Uninstalling dependencies: Epic extension"
    uninstall
else
    echo "Installing dependencies: Epic extension"
    install
fi
