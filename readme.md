# OMB Max Lambda Theme

A customized lambda Oh-My-Bash theme with emoji indicators for a modern, informative terminal prompt.

## Features

- 🐍 Python virtual environment indicator
- 🔋 Battery percentage
- 🕐 Current time
- 💁 Username and 💻 hostname
- 📁 Current directory path
- 🌿 Git branch with status indicators (staged, unstaged, untracked, ahead/behind)
- Clean two-line prompt design

## Preview

```
╭─🐍 venv 🔋53% 🕐 19:30:08 💁 max at 💻 maxps in 📁 ~/project
│on (🌿 main +2 •1 ⌀2 ✗)
╰λ 
```

## Installation

```bash
./install.sh
```

Then update your `~/.bashrc`:

```bash
OSH_THEME="lambda-custom"
```

Reload your configuration:

```bash
source ~/.bashrc
```

## Requirements

- [Oh-My-Bash](https://github.com/ohmybash/oh-my-bash)
- Terminal with emoji support
- Git (for repository status)

### Oh-My-Bash plugins

- git
- battery