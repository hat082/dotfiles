# dotfiles
My dotfiles

## nvim
clear cache

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

create a user config

```bash
git clone https://github.com/AstroNvim/user_example.git ~/dotfiles/.config/nvim/lua/user/
rm -rf .git
```

AstroCommunity: https://github.com/AstroNvim/astrocommunity/

## Command line tools
https://www.youtube.com/watch?v=2OHrTQVlRMg

exa 
bat 
ripgrep
entr
midnight commander

### fzf

#### Installation

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### zoxide

```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```
