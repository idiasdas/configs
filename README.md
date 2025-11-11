# Configs

These are my personal configs for neovim, tmux, i3, bash, ...

## Setup

1. Clone it to `~/configs`

2. Execute:

```bash
./personal-install.sh [--dry] [filter]
./personal-config.sh [--dry]
```

You can use `--dry` to check what these scripts will do.
The `filter` option will only execute the matching scripts in `install-scripts/`. For example:

```bash
$ ./personal-install.sh --dry nvim
[DRY RUN]: /home/idiasdas/configs -- nvim
[DRY RUN]: Filtering -- ./install-scripts/tmux_plugins
[DRY RUN]: Filtering -- ./install-scripts/i3
[DRY RUN]: [EXECUTE]: ././install-scripts/nvim.sh
```
