# dotfiles

My dotfiles managed by Gnu stow.

## Usage

1. install [Gnu stow](https://formulae.brew.sh/formula/stow)
1. clone this repository
1. `cd /path/to/this/directory`
1. `./setup.sh`

### Zsh

Install [ZI](https://z-shell.pages.dev/docs/getting_started/installation).

```sh
$ source ~/.zshrc
$ source ~/.zshenv
```

### HomeBrew

install & upgrade tools.

```sh
$ cd ~/.config/homebrew
$ brew bundle
```

### Krew

install with [announced method](https://krew.sigs.k8s.io/docs/user-guide/setup/install/#bash).

```sh
# install krew plugins
$ k krew install < ~/.config/krew/plugins

# upgrade krew plugins
$ k krew upgrade < ~/.config/krew/plugins
```

### Neovim

install [dein](https://github.com/Shougo/dein.vim) and execute `nvim` command.

## Tools

manage dotfiles for following tools.

- [alacritty](https://github.com/alacritty/alacritty)
- [karabiner](https://karabiner-elements.pqrs.org/)
- [nvim](https://neovim.io/)
- [skhd](https://github.com/koekeishiya/skhd)
- [tmux](https://github.com/tmux/tmux)
- [yabai](https://github.com/koekeishiya/yabai)
- [zsh](https://zsh.sourceforge.io/)
