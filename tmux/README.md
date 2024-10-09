# Requirements

This config requires the `tpm` plugin manager which you must install in `~/.tmux/plugins/`.

Check the [repo](https://github.com/tmux-plugins/tpm), but normally the command should be:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Create a symbolic link on `~/`:

```bash
ln -s <path-to-tmux-config/.tmux.conf> .
```

Moreover, you must use `<leader>I` within a tmux session to install the plugins.

# Verification

Check the `.tmux/plugins` dir to verify that the plugins are properly installed.
