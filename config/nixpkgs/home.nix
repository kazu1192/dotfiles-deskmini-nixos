programs.zsh = {
  zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
    ];
  };
  # Automatic startup upon TTY login
  loginShellInit = "
    if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
      exec sway
    fi
  ";
};
