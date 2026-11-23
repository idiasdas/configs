# Configs

These are my personal configs for neovim, tmux, bash and git (WSL setup).

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
$ ./personal-install.sh --dry tmux
[DRY RUN]: /home/igord/configs -- tmux
[DRY RUN]: [EXECUTE]: ././install-scripts/tmux_plugins
```

## Neovim

Neovim is not installed by these scripts. Build it from source in `~/dev/neovim`;
`bashrc` adds `~/dev/neovim/build/bin` to `PATH`.

The TypeScript setup uses the project's own `node_modules/.bin/tsc`, so it needs Node.
`bashrc` loads Node through [nvm](https://github.com/nvm-sh/nvm) from `~/.nvm`.
