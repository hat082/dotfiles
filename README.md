# dotfiles
My dotfiles

## nvim
clear cache

```bash

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

```

find all available functions for lsp
:h vim.lsp.buf


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

add to .bashrc
```bash
eval "$(zoxide init bash)"
```


## syncthing

```bash

sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list

```

you can refer to the website: https://apt.syncthing.net/


## changing default teriminal application

```bash
sudo nano /etc/profile
```

change the following:

export Terminal="/usr/bin/xterm"

