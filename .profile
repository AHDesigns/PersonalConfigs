# ~/.profile: executed by the command interpreter for login shells.
echo "source .profile"

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
  PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME.rbenv/shims" ] ; then
  PATH="$HOME.rbenv/shims:$PATH"
fi

if [ -d "$HOME/.nodenv/shims" ] ; then
  PATH="$HOME/.nodenv/shims:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ; then
  PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/.dotnet/tools" ] ; then
  PATH="$HOME/.dotnet/tools:$PATH"
fi

if [ -d "/usr/local/share/dotnet" ] ; then
  PATH="/usr/local/share/dotnet:$PATH"
fi

if [ -d "/opt/X12/bin" ] ; then
  PATH="/opt/X12/bin:$PATH"
fi

if [ -d "/opt/local/bin" ] ; then
  PATH="/opt/local/bin:$PATH"
fi

# maconly
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  if [ -d "/usr/local/opt/gnu-sed/libexec/gnubin" ] ; then
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  fi

  if [ -d "/Library/Frameworks/Mono.framework/Versions/Current/Commands" ] ; then
    PATH="/Library/Frameworks/Mono.framework/Versions/Current/Commands:$PATH"
  fi

fi

# linux
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  # remap capslock to ctrl
  gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
fi

export EDITOR='vim'
export SOURCED_PROFILE=true