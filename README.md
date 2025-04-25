# Terminal config backup and restore

## Backup

```bash
backup.sh
git add .
git commit -m "New neovim config"
```

## Restore

### Terminal

Restore the xfce4-terminal config:

```bash
cp ./xfce4-terminal.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/
```

Restore terminal themes. This needs to be done _after_ Neovim restore because it relies on themes delivered by a nvim plugin:

```bash
cp ~/.local/share/nvim/lazy/tokyonight.nvim/extras/xfceterm/*.theme ~/.local/share/xfce4/terminal/colorschemes/
```

After the themes are restored, there is no action. They are just presets, but the terminal config already has the preset colors correctly set. Restoring those above themes are just for future changes to have access to theme presets.

### tmux

Restore tmux config:

```bash
cp ./.tmux.conf ~
```

Open tmux and install addons with `<C-b>+I`. To update addons run `<C-b>+u`.

### Neovim

Install the Neovim release that matches the version in `./nvim_version`. This can just be downloaded from the [nvim GitHub releases](https://github.com/neovim/neovim/releases).

Copy nvim config:

```bash
cp ./init.lua ~/.config/nvim/
```

Restore Lazy plugins:

```bash
cp ./lazy-lock.json ~/.config/nvim/
```

Once copied, open nvim and run `:Lazy restore`.

Restore Mason LSPs:

```bash
cp ./mason-lock.json ~/.config/nvim/
```

Once copied, open nvim and run `:MasonLockRestore`.

Restore editorconfig:

```bash
# Restore editorconfig
cp ./.editorconfig ~
```

Restore helpers:

```bash
cp ./.vim_helpers.sh ~
```

After helpers are restored, ensure that they are sourced in `~/.bashrc`:

```bash
source /home/trstringer/.vim_helpers.sh
```
