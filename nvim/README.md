# Setting up neovim

This is a summary of the steps describe on the [documentation](https://github.com/neovim/neovim/tree/master) and a few other places, as well as some steps necessary for plugins setup.
These steps are a guide to myself. Don't trust them too much. I forgot most of the things I had to do to make all plugins work.
The process usually consists of reading the errors and the `checkhealth` command output in `nvim`.

I also don't recommend using my config. If you want something functional with many plugins out of the box, consider something like [lazy.vim](http://www.lazyvim.org/).
If you want to start from scratch, I recommend [these videos](https://www.youtube.com/watch?v=zHTeCSVAFNY).

## Requirements

### Neovim

```bash
sudo apt-get install ninja-build gettext cmake unzip curl build-essential xclip
```

### Plugins Requirements

#### Nerdfonts

Choose whichever `nerd-font` you want. I usually get `JetBrainsMonoNLNerdFontoMono-Regular.ttf` from [here](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular).

Move the file to `/usr/local/share/fonts/`. Then, restart the computer or run:

```bash
fc-cache -f -v
```

Now set your terminal to use this font. It should solve problems with broken icons in `nvim`.

#### LazyGit

Check [here](https://github.com/jesseduffield/lazygit) for updated instructions, but it should be just:

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

#### Luarocks and Lua5.1

Check [here](https://luarocks.org/) and [here](https://www.lua.org/download.html).

Install lua5.1:

```bash
curl -L -R -O  https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar zxf lua-5.1.5.tar.gz
cd lua-5.1.5
make all test
```

Install luarocks:

```bash
wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
tar zxpf luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure && make && sudo make install
sudo luarocks install luasocket
```

Test by running `lua`, you should get:

```bash
Lua 5.3.5 Copyright (C) 1994-2018 Lua.org, PUC-Rio
> require "socket"
```

#### Ripgrep and fd-find

```bash
sudo apt install ripgrep fd-find
```

However, this will not give you the latest `ripgrep` release. Check their repo for more info.

## Install nvim

These steps install neovim in `$HOME/neovim`. I prefer this to delete it easily.

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
rm -r build
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
echo "export PATH='\$HOME/neovim/bin:\$PATH'" >> $HOME/.bashrc
```

Verify that `export PATH="$HOME/neovim/bin:$PATH"` was added to the last line of `$HOME/.bashrc`.

At this point, you should be able to run `nvim` from anywhere.

## Setup nvim config

```bash
cd ~/.config/nvim
ln -s ~/configs/nvim/ nvim
```
