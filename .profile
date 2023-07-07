if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
if [[ -d "$HOME/local/bin" ]]; then
  export PATH="$HOME/local/bin:$PATH"
fi
if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi
if [[ -d "/usr/local/opt/go/libexec/bin" ]]; then
  export PATH="/usr/local/opt/go/libexec/bin:$PATH"
fi
