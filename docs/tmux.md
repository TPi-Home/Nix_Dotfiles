# Tmux Setup

## Table of Contents

- [Overview](#overview)
- [Starting Tmux](#starting-tmux)
- [Sessions](#sessions)
- [Windows](#windows)
- [Panes](#panes)
- [Navigation](#navigation)
- [Copy Mode](#copy-mode)
- [Mouse Support](#mouse-support)
- [Configuration](#configuration)

---

## Overview

Tmux is a terminal multiplexer that allows multiple terminal sessions, windows, and panes to run within a single terminal.

This configuration uses Vim-style navigation, mouse support, and custom pane-splitting shortcuts.

### Features

- Vi-style copy mode
- Mouse scrolling and pane selection
- 50,000 lines of scrollback history per pane
- Vim-style pane navigation using `vim-tmux-navigator`
- Custom pane-splitting shortcuts
- Default tmux session and window management

### Prefix Key

The default prefix is `Ctrl+b`.

Most tmux commands require pressing `Ctrl+b`, releasing both keys, and then pressing the command key.

For example, `Ctrl+b`, then `v` creates a side-by-side split.

---

## Starting Tmux

| Command | Description |
|---|---|
| `tmux` | Start a new session |
| `tmux new -s dev` | Create a named session |
| `tmux ls` | List existing sessions |
| `tmux attach -t dev` | Attach to a named session |
| `tmux kill-session -t dev` | Terminate a named session |
| `tmux kill-server` | Terminate all sessions |

Sessions remain running after detaching, allowing you to return to your work later.

---

## Sessions

A session contains one or more windows. Each window can contain multiple panes.

| Shortcut | Action |
|---|---|
| `Ctrl+b`, `s` | Open session selector |
| `Ctrl+b`, `d` | Detach from session |
| `Ctrl+b`, `$` | Rename current session |
| `Ctrl+b`, `(` | Switch to previous session |
| `Ctrl+b`, `)` | Switch to next session |

To create another session from inside tmux, open the command prompt with `Ctrl+b`, then `:` and enter:

```tmux
new-session -s dev
```

---

## Windows

Windows function similarly to tabs in a terminal emulator.

| Shortcut | Action |
|---|---|
| `Ctrl+b`, `c` | Create a new window |
| `Ctrl+b`, `n` | Next window |
| `Ctrl+b`, `p` | Previous window |
| `Ctrl+b`, `0–9` | Switch to numbered window |
| `Ctrl+b`, `w` | Open window selector |
| `Ctrl+b`, `,` | Rename current window |
| `Ctrl+b`, `&` | Close current window |

Windows are independent workspaces within a session.

---

## Panes

Panes divide a window into multiple terminal areas.

### Splitting Panes

| Shortcut | Action |
|---|---|
| `Ctrl+b`, `v` | Split left/right |
| `Ctrl+b`, `b` | Split top/bottom |
| `Ctrl+b`, `x` | Close current pane |
| `Ctrl+b`, `z` | Zoom or restore current pane |
| `Ctrl+b`, `Space` | Cycle through pane layouts |

### Example Layout

```text
┌──────────────────┬──────────────────┐
│                  │                  │
│      Pane 1      │      Pane 2      │
│                  ├──────────────────┤
│                  │      Pane 3      │
└──────────────────┴──────────────────┘
```

To create this layout:

1. Start tmux.
2. Press `Ctrl+b`, then `v` to create two side-by-side panes.
3. Select the right pane.
4. Press `Ctrl+b`, then `b` to split it into top and bottom panes.

The new pane opens in the same window.

**Note:** Binding `b` overrides tmux's default `prefix + b` shortcut, which normally sends the prefix key to the application.

---

## Navigation

The `vim-tmux-navigator` plugin provides Vim-style pane navigation without requiring the tmux prefix.

| Shortcut | Direction |
|---|---|
| `Ctrl+h` | Left |
| `Ctrl+j` | Down |
| `Ctrl+k` | Up |
| `Ctrl+l` | Right |

The configuration also supports directional navigation using the prefix and arrow keys.

| Shortcut | Direction |
|---|---|
| `Ctrl+b`, `Left` | Left |
| `Ctrl+b`, `Down` | Down |
| `Ctrl+b`, `Up` | Up |
| `Ctrl+b`, `Right` | Right |

For seamless navigation between tmux panes and Neovim splits, the corresponding Neovim plugin must also be configured.

---

## Copy Mode

Copy mode allows scrolling, searching, and selecting terminal output using Vim-style commands.

Enter copy mode with `Ctrl+b`, then `[`.

### Movement

| Key | Action |
|---|---|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Next word |
| `b` | Previous word |
| `gg` | Beginning of scrollback |
| `G` | End of scrollback |
| `/` | Search forward |
| `?` | Search backward |

### Selection and Copying

| Key | Action |
|---|---|
| `v` | Begin selection |
| `Ctrl+v` | Toggle rectangular selection |
| `y` | Copy selection and exit |
| `q` | Exit copy mode |
| `Ctrl+b`, `]` | Paste copied text |

Copied text is stored in tmux's internal paste buffer. It is not automatically synchronized with the system clipboard.

---

## Mouse Support

Mouse support is enabled through:

```nix
mouse = true;
```

This allows:

- Scrolling through terminal history using the mouse wheel
- Clicking panes to select them
- Resizing panes by dragging their borders
- Selecting text with the mouse

Scrolling upward automatically enters tmux's scrollback mode when appropriate.

Hold `Shift` while selecting text to allow the terminal emulator to handle selection, if supported.

---

## Configuration

The configuration is managed declaratively through Nix.

### General Settings

| Option | Value | Description |
|---|---|---|
| `enable` | `true` | Enables tmux |
| `keyMode` | `"vi"` | Enables Vi-style copy mode |
| `mouse` | `true` | Enables mouse interaction |
| `historyLimit` | `50000` | Sets scrollback history limit |

### Plugins

The following plugin is enabled:

```nix
plugins = with pkgs.tmuxPlugins; [
  vim-tmux-navigator
];
```

### Custom Keybindings

```tmux
# Pane splitting
bind-key v split-window -h
bind-key b split-window -v

# Pane navigation
bind-key Left  select-pane -L
bind-key Down  select-pane -D
bind-key Up    select-pane -U
bind-key Right select-pane -R

# Vi copy mode
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
```

### Reloading Configuration

After rebuilding the NixOS or Home Manager configuration, newly started tmux servers will use the updated settings.

To reload an existing tmux server, use `Ctrl+b`, then `:` and enter:

```tmux
source-file /path/to/generated/tmux.conf
```

The actual configuration path depends on whether tmux is managed by Home Manager or the NixOS system module.

Alternatively, terminate the tmux server and start a new session:

```bash
tmux kill-server
tmux
```

**Warning:** `tmux kill-server` terminates all running tmux sessions and their processes. Save your work before using it.