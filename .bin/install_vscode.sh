#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User
VSCODE_CONFIG_DIR=$(cd ${SCRIPT_DIR}/../.vscode && pwd)

command echo -e "vscode: linking settings.json"
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

command echo -e "vscode: linking keybindings.json"
rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
: ' TODO
command echo -e "vscode: installing extensions"
cat ${VSCODE_CONFIG_DIR}/extensions | while read line
do
 code --install-extension $line
done

code --list-extensions
cp -rt $HOME/.vscode/extensions ${VSCODE_CONFIG_DIR}
'
command echo -e "vscode: complete!"