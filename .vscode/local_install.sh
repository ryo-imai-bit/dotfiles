#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Documents/GitHub

if [[ -d "$VSCODE_SETTING_DIR/goo" ]]
then
    rm -r "$VSCODE_SETTING_DIR/goo/.vscode"  
    mkdir "$VSCODE_SETTING_DIR/goo/.vscode"
    ln -s "$SCRIPT_DIR/local/goo/.vscode/settings.json" "${VSCODE_SETTING_DIR}/goo/.vscode/settings.json"
fi

if [[ -d "$VSCODE_SETTING_DIR/rank-king" ]]
then
    rm -r "$VSCODE_SETTING_DIR/rank-king/.vscode"  
    mkdir "$VSCODE_SETTING_DIR/rank-king/.vscode"
    ln -s "$SCRIPT_DIR/local/rank-king/.vscode/settings.json" "${VSCODE_SETTING_DIR}/rank-king/.vscode/settings.json"
fi

if [[ -d "$VSCODE_SETTING_DIR/creditcard" ]]
then
    rm -r "$VSCODE_SETTING_DIR/creditcard/.vscode"  
    mkdir "$VSCODE_SETTING_DIR/creditcard/.vscode"
    ln -s "$SCRIPT_DIR/local/creditcard/.vscode/settings.json" "${VSCODE_SETTING_DIR}/creditcard/.vscode/settings.json"
fi

if [[ -d "$VSCODE_SETTING_DIR/excite" ]]
then
    rm -r "$VSCODE_SETTING_DIR/excite/.vscode"  
    mkdir "$VSCODE_SETTING_DIR/excite/.vscode"
    ln -s "$SCRIPT_DIR/local/excite/.vscode/settings.json" "${VSCODE_SETTING_DIR}/excite/.vscode/settings.json"
fi

echo $0

