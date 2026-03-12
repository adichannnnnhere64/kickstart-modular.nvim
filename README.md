# Neovim Config

Modular Neovim configuration built around `lazy.nvim`.

## Requirements

- Basic utils: `git`, `make`, `unzip`, C compiler (`gcc`/`clang`)
- `ripgrep`, `fd`
- Clipboard tool (`xclip`/`xsel`/`win32yank`, etc.)
- Nerd Font (optional): set `vim.g.have_nerd_font = true` in `init.lua`

## Install

Clone into your Neovim config directory:

```sh
git clone <YOUR_REPO_URL> "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Then start Neovim:

```sh
nvim
```

## Multiple configs (optional)

Use `NVIM_APPNAME` to keep multiple configs side-by-side:

```sh
NVIM_APPNAME="nvim-work" nvim
```
