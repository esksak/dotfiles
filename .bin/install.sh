#!/usr/bin/env bash
set -ue

CURRENT_DIR=$(cd $(dirname $0) && pwd)
DEST=$HOME

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

mkdir_not_exist() {
	if [ ! -d "$1" ]; then
    command echo "$1 not found. Auto Make it"
		mkdir -p "$1"
	fi
}

link_config_dir() {
	local dotfiles_dir=$1
  local dest_dir=$2
	local backup_dir=$3
  mkdir_not_exist $dest_dir
  mkdir_not_exist $backup_dir
  for f in $dotfiles_dir/* $dotfiles_dir/.??*; do
    [[ `basename $f` == ".vscode" ]] && continue
    [[ `basename $f` == *\**  ]] && continue
    [[ -d "$dotfiles_dir/`basename $f`" ]] && link_config_dir "${dotfiles_dir}/`basename $f`" "${dest_dir}/`basename $f`" "${backup_dir}/`basename $f`" && continue
    if [[ -L "$dest_dir/`basename $f`" ]];then
      command rm -f "$dest_dir/`basename $f`"
    fi
    if [[ -f "$dest_dir/`basename $f`" ]];then
      command mv "$dest_dir/`basename $f`" "$backup_dir"
    fi
    command ln -snf $f $dest_dir
  done
}

link_to_homedir() {
  local backup_dir=$DEST/.dotbackup
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir="$(dirname ${script_dir})/files"
  mkdir_not_exist $backup_dir
  if [[ "$DEST" != "$dotdir" ]];then
    link_config_dir $dotdir $DEST $backup_dir
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    --test|-t)
      DEST=/tmp/tmphome
      mkdir_not_exist $DEST
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
# git config --global include.path "~/.gitconfig_shared"
source ${CURRENT_DIR}/install_vscode.sh
command echo -e "\e[1;36m Install completed!!!! \e[m"
