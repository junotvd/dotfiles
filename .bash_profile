#MacOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

