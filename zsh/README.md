# Zsh Configuration 

Zsh reads the following configuration files in order.

1. `.zshenv`   - should contain user environment variables.
2. `.zprofile` - used to execute command after login.
3. `.zshrc`    - used to configure the shell itself and running commands.
4. `.zlogin`   - same as `.zprofile` but runs after `.zshrc`.
5. `.zlogout`  - used to execute command when a shell exits.
