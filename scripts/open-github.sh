#!/usr/bin/env bash

cd "$(tmux display-message -p '#{pane_start_path}')"
url=$(git remote get-url origin) || {
	echo "No 'origin' remote found"
	exit 1
}

if [[ $url == git@* ]]; then
	url="${url#git@}"
	url="${url/://}"
	url="https://$url"
fi
url="${url%.git}"

if [[ $url == *github.com* || $url == *codeberg.com* ]]; then
	xdg-open "$url"
else
	echo "Unsupported host: $url"
	exit 1
fi
