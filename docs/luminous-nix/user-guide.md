# User Guide

Complete guide to using Luminous Nix for NixOS system management through natural language.

## Overview

This guide covers all features of Luminous Nix in depth. If you're new, start with the [Quick Start Guide](quickstart.md).

**What you'll learn:**

- Natural language patterns that work best
- Package management workflows
- System configuration
- Development environments
- Safety features and rollback
- Configuration and customization
- Troubleshooting and optimization

## Understanding Natural Language

### How Luminous Nix Understands You

Luminous Nix uses a local AI model to understand your intentions in natural language. It doesn't just match keywords—it understands context and meaning.

**Example:**

```bash
# All of these mean the same thing to Luminous Nix:
ask-nix "install firefox"
ask-nix "I want to use Firefox"
ask-nix "add Firefox browser to my system"
ask-nix "can you install the Firefox web browser?"
```

**How it works:**

1. **Intent Classification** - Determines what you want (install, remove, search, configure, etc.)
2. **Entity Extraction** - Identifies specific items (package names, services, etc.)
3. **Context Understanding** - Considers your system state and history
4. **Action Planning** - Determines the steps needed
5. **Verification** - Shows you the plan before executing

### Natural Language Patterns

#### Commands vs. Questions

**Both work:**

```bash
# Command form
ask-nix "install htop"

# Question form
ask-nix "how do I install htop?"
```

**Luminous Nix responds appropriately:**

Command → Shows plan and asks confirmation
Question → Explains the process and offers to do it

#### Specificity Levels

**Vague (Luminous Nix will ask for clarification):**

```bash
ask-nix "I need a text editor"

Response: "I found several text editors:
  1. vim - Modal text editor
  2. emacs - Extensible text editor
  3. nano - Simple terminal editor
  4. vscode - Visual Studio Code
  5. gedit - GNOME text editor

  Which would you like to install?"
```

**Specific (Luminous Nix proceeds directly):**

```bash
ask-nix "install vim"

Response: "Installing vim text editor...

  Changes:
    + vim → systemPackages

  Proceed? [y/N]"
```

**Descriptive (Luminous Nix suggests best match):**

```bash
ask-nix "I need a simple text editor for beginners"

Response: "Based on your needs, I recommend nano:
  - Simple and beginner-friendly
  - No learning curve
  - Common in tutorials

  Alternative: gedit (GUI option)

  Install nano? [y/N]"
```

#### Multi-Step Requests

**Break complex tasks into steps:**

```bash
# Instead of:
ask-nix "install docker and python and nodejs and configure them for development"

# Do this:
ask-nix "install docker"
[wait for completion]
ask-nix "install python nodejs"
[wait for completion]
ask-nix "create a dev environment with these"
```

**Why:** Each step can be verified and rolled back independently.

## Package Management

### Searching for Packages

#### Basic Search

```bash
# Search by description
ask-nix "find a markdown editor"
ask-nix "search for video editing software"
ask-nix "what packages are available for Python development?"
```

**Response includes:**

- Package names
- Descriptions
- Popularity indicators
- Installation commands

#### Search by Category

```bash
ask-nix "show me all text editors"
ask-nix "list development tools"
ask-nix "what multimedia packages are available?"
```

#### Search by Feature

```bash
ask-nix "I need a tool to convert PDFs"
ask-nix "what can I use to monitor system resources?"
ask-nix "find something for screen recording"
```

### Installing Packages

#### Single Package

```bash
ask-nix "install firefox"
```

**Luminous Nix shows:**

```
Understanding: Install Firefox web browser

Changes to make:
  + firefox (124.0.2) → environment.systemPackages

This will modify:
  /etc/nixos/configuration.nix

Why: Adding firefox to system packages makes it
     available to all users globally

Impact:
  • Download size: ~95MB
  • Installed size: ~245MB
  • Rebuild time: ~2-3 minutes
  • Reversible: Yes

Proceed? [y/N]
```

#### Multiple Packages

```bash
ask-nix "install vim htop git"
```

Luminous Nix processes all three and shows combined changes.

#### Package with Options

```bash
ask-nix "install firefox with wayland support"
ask-nix "I need python with development tools"
```

Luminous Nix configures appropriate package options.

### Removing Packages

```bash
ask-nix "remove firefox"
ask-nix "uninstall vim"
ask-nix "I don't need htop anymore"
```

**Safe removal:**

- Shows what will be removed
- Warns about dependencies
- Offers to keep configuration
- Confirms before proceeding

### Updating Packages

#### Update Specific Package

```bash
ask-nix "update firefox"
```

#### Update All Packages

```bash
ask-nix "update everything"
ask-nix "check for updates and install them"
```

**Update process:**

1. Checks for available updates
2. Shows what will change (versions)
3. Estimates download size
4. Asks for confirmation
5. Performs update
6. Tests system after update

### Listing Packages

```bash
# Show all installed packages
ask-nix "what's installed?"
ask-nix "list my packages"

# Show packages matching pattern
ask-nix "show me all python packages"
ask-nix "list text editors I have installed"

# Show package details
ask-nix "tell me about firefox"
ask-nix "what version of vim is installed?"
```

## System Configuration

### Enabling Services

```bash
ask-nix "enable docker"
ask-nix "start the SSH server"
ask-nix "I want to use printing"
```

**What Luminous Nix does:**

1. Identifies the service
2. Shows configuration changes
3. Explains what the service does
4. Warns about security implications (if any)
5. Adds service to configuration
6. Enables and starts service

**Example output:**

```
Understanding: Enable Docker containerization

Changes to make:
  + virtualisation.docker.enable = true
  + users.users.yourname.extraGroups = [ "docker" ]

This will:
  • Install Docker daemon
  • Enable Docker service at boot
  • Add your user to docker group
  • Allow running containers without sudo

Security note: Docker group grants root-equivalent access

Proceed? [y/N]
```

### Disabling Services

```bash
ask-nix "disable bluetooth"
ask-nix "stop the print server"
ask-nix "I don't need SSH"
```

### Configuring Services

```bash
ask-nix "configure nginx to serve on port 8080"
ask-nix "set up postgresql with my user"
ask-nix "enable firewall and allow SSH"
```

**Complex configurations:**

For very detailed configurations, Luminous Nix:
1. Sets up basic configuration
2. Shows you the config file location
3. Suggests editing manually for complex cases
4. Offers to reapply after manual edits

### System Settings

#### User Management

```bash
ask-nix "create a user called bob"
ask-nix "add myself to the docker group"
ask-nix "what groups am I in?"
```

#### Network Configuration

```bash
ask-nix "set my hostname to mycomputer"
ask-nix "configure wifi"
ask-nix "show me my IP address"
```

#### Boot Configuration

```bash
ask-nix "add a kernel parameter"
ask-nix "change boot timeout"
ask-nix "list my boot entries"
```

## Development Environments

### Creating Dev Shells

Nix dev shells provide isolated development environments.

#### Quick Dev Shell

```bash
ask-nix "create a python dev environment"
```

**Luminous Nix creates:**

```nix
# Saved to shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
  ];

  shellHook = ''
    echo "Python development environment"
    echo "Python: $(python --version)"
  '';
}
```

**Enter the environment:**

```bash
nix-shell
```

#### Language-Specific Shells

```bash
# Rust
ask-nix "create rust dev shell with cargo"

# Node.js
ask-nix "set up node development"

# Go
ask-nix "I need a go environment"

# Multiple languages
ask-nix "create a dev shell with python, node, and rust"
```

#### Custom Dev Shells

```bash
ask-nix "create a web dev environment with nodejs, postgresql, and redis"
```

**Luminous Nix includes:**

- Runtime (Node.js)
- Database (PostgreSQL)
- Cache (Redis)
- Common tools (git, curl, etc.)
- Setup scripts

### Managing Dev Shells

```bash
# List existing shells
ask-nix "show my dev environments"

# Update a shell
ask-nix "add typescript to my node shell"

# Remove a shell
ask-nix "remove the python shell"
```

### Direnv Integration

For automatic environment activation:

```bash
ask-nix "set up direnv for this project"
```

Creates `.envrc`:

```bash
use nix
```

Now `cd` into directory automatically loads environment.

## Safety Features

### Preview Before Apply

**Every change is previewed:**

```bash
ask-nix "install firefox"

# Shows:
📋 Proposed changes:
  + firefox → systemPackages

💾 Files to modify:
  /etc/nixos/configuration.nix

⚠️  Impact:
  • Download: 95MB
  • Rebuild: 2-3 min
  • Reversible: Yes

Proceed? [y/N]
```

**Type 'y' to proceed, anything else cancels.**

### Rollback Support

NixOS keeps previous system generations:

```bash
# List previous generations
ask-nix "show me my system history"
ask-nix "list previous configurations"

# Rollback to previous
ask-nix "rollback to previous generation"
ask-nix "undo last change"

# Rollback to specific generation
ask-nix "rollback to generation 42"
```

**What rollback does:**

- Switches to previous configuration
- No data loss
- Instant (just changes symlinks)
- Can roll forward again

### Dry Run Mode

Test changes without applying:

```bash
ask-nix "install firefox" --dry-run
```

Shows what would happen, but doesn't modify anything.

### Validation

Before applying changes, Luminous Nix:

1. **Syntax checks** - Validates NixOS configuration syntax
2. **Dependency resolution** - Ensures all dependencies available
3. **Conflict detection** - Warns about conflicting options
4. **Build test** - Simulates build to catch errors
5. **User confirmation** - Requires explicit approval

## Configuration & Customization

### Luminous Nix Configuration

Configuration file: `~/.config/luminous-nix/config.yaml`

```yaml
# General settings
language: "en-US"
verbosity: "normal"  # quiet, normal, verbose

# AI settings
model: "mistral"  # mistral, llama, phi
model_temperature: 0.7
context_window: 4096

# Safety settings
always_preview: true
require_confirmation: true
create_backups: true
max_backup_generations: 10

# Interface settings
color_scheme: "default"  # default, light, dark
show_hints: true
progress_bars: true

# Voice settings (if enabled)
voice:
  enabled: true
  model: "whisper-small"
  language: "en-US"

# Advanced
cache_responses: true
parallel_operations: false
custom_nixpkgs_path: null
```

### Editing Configuration

```bash
# Open config in editor
luminous-nix config edit

# Set specific values
luminous-nix config set verbosity verbose
luminous-nix config set model llama

# View current config
luminous-nix config show

# Reset to defaults
luminous-nix config reset
```

### Custom Aliases

Create shortcuts for common commands:

```bash
# In your shell rc file (.bashrc, .zshrc)
alias update-system='ask-nix "update everything"'
alias clean-system='ask-nix "run garbage collection"'
alias dev-python='ask-nix "create python dev environment"'
```

### Hooks

Run custom commands before/after operations:

```yaml
# In config.yaml
hooks:
  pre_install:
    - echo "Installing package..."
  post_install:
    - notify-send "Installation complete"
  pre_rebuild:
    - git commit -am "Auto-backup before rebuild"
```

## Advanced Usage

### Batch Operations

Process multiple commands from a file:

```bash
# commands.txt
install firefox
install vim
enable docker
create python dev shell

# Execute batch
luminous-nix batch commands.txt
```

### Scripting

Use Luminous Nix in scripts:

```bash
#!/usr/bin/env bash

# Install packages non-interactively
luminous-nix ask "install htop" --yes --quiet

# Check status
if [ $? -eq 0 ]; then
    echo "Installation successful"
else
    echo "Installation failed"
    exit 1
fi
```

### JSON Output

Get machine-readable output:

```bash
ask-nix "list installed packages" --json

# Output:
{
  "packages": [
    {"name": "firefox", "version": "124.0.2"},
    {"name": "vim", "version": "9.0.1"},
    ...
  ]
}
```

Use with `jq` for processing:

```bash
ask-nix "list installed packages" --json | jq '.packages[].name'
```

### Integration with Other Tools

#### With Git

```bash
# Auto-commit configuration changes
ask-nix config set hooks.post_rebuild \
  "cd /etc/nixos && git add . && git commit -m 'Auto-commit'"
```

#### With Backup Tools

```bash
# Backup before major changes
ask-nix config set hooks.pre_rebuild \
  "rsync -av /etc/nixos/ /backup/nixos/"
```

#### With Notification Systems

```bash
# Desktop notifications
ask-nix config set hooks.post_install \
  "notify-send 'Luminous Nix' 'Operation complete'"
```

## Troubleshooting

### Common Issues

#### "Command not understood"

**Problem:** Luminous Nix can't interpret your request

**Solutions:**

1. **Be more specific:**
   ```bash
   # Instead of: "fix this"
   # Try: "how do I configure docker?"
   ```

2. **Use different wording:**
   ```bash
   # If "set up X" doesn't work
   # Try "install X" or "enable X"
   ```

3. **Break into smaller steps:**
   ```bash
   # Instead of complex multi-step
   # Do one thing at a time
   ```

4. **Check verbosity:**
   ```bash
   luminous-nix config set verbosity verbose
   # More detailed error messages
   ```

#### "Permission denied"

**Problem:** Need sudo/root access

**Solution:**

```bash
# Run with sudo for system changes
sudo luminous-nix ask "install firefox"

# Or configure sudo-less operation:
ask-nix "add myself to nixbld group"
```

#### "Build failed"

**Problem:** Package build error

**Solutions:**

1. **Check error message:**
   ```bash
   ask-nix "why did the build fail?"
   ```

2. **Update package database:**
   ```bash
   ask-nix "update package channels"
   ```

3. **Try alternative package:**
   ```bash
   ask-nix "show alternatives to firefox"
   ```

4. **Check system resources:**
   ```bash
   ask-nix "show disk space"
   ask-nix "show memory usage"
   ```

#### "Model download failed"

**Problem:** AI model download error

**Solutions:**

```bash
# Retry download
luminous-nix setup --reinstall-model

# Use smaller model
luminous-nix config set model phi

# Specify custom model path
luminous-nix config set model_path /path/to/model
```

### Debugging

#### Enable Debug Mode

```bash
# Verbose output
ask-nix "install firefox" --debug

# Or set globally
luminous-nix config set debug_mode true
```

#### View Logs

```bash
# Recent logs
luminous-nix logs

# Specific operation
luminous-nix logs --filter "install"

# Full log file
less ~/.cache/luminous-nix/luminous-nix.log
```

#### Test Configuration

```bash
# Validate NixOS config
luminous-nix test

# Dry-run rebuild
nixos-rebuild dry-build
```

### Getting Help

**Built-in help:**

```bash
# General help
luminous-nix --help

# Topic-specific help
ask-nix "how do I...?"
ask-nix "explain docker configuration"
```

**Community:**

- [FAQ](faq.md)
- [Discord](https://discord.gg/luminous)
- [GitHub Discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- [Support Guide](../community/support.md)

## Performance Optimization

### Speed Up Operations

#### Use Faster Model

```bash
luminous-nix config set model phi
# Faster but slightly less accurate
```

#### Enable Caching

```bash
luminous-nix config set cache_responses true
# Reuses responses for repeated queries
```

#### Parallel Operations

```bash
luminous-nix config set parallel_operations true
# Faster for multi-package operations
# Use with caution
```

### Reduce Resource Usage

#### Smaller Context Window

```bash
luminous-nix config set context_window 2048
# Uses less memory
```

#### Limit History

```bash
luminous-nix config set max_history 50
# Keeps fewer past interactions
```

### Optimize NixOS

```bash
# Clean old generations
ask-nix "delete old system generations"
ask-nix "keep only last 5 generations"

# Garbage collection
ask-nix "run garbage collection"
ask-nix "free up disk space"

# Optimize Nix store
ask-nix "optimize nix store"
```

## Best Practices

### Do's

✅ **Start specific, broaden if needed**
```bash
ask-nix "install firefox"  # Specific
# If not found: "install a web browser"  # Broader
```

✅ **One task at a time**
```bash
ask-nix "install docker"
[verify it works]
ask-nix "enable docker service"
```

✅ **Use natural language**
```bash
ask-nix "I need Python for web development"
# Better than trying to remember exact package names
```

✅ **Review changes before applying**
```bash
# Always read the preview
# Understand what will change
# Only proceed if it looks right
```

✅ **Keep backups**
```bash
# Regular backups of /etc/nixos
git init /etc/nixos
git add .
git commit -m "Backup"
```

### Don'ts

❌ **Don't batch unrelated operations**
```bash
# Bad: "install firefox and configure nginx and create python shell"
# Good: Three separate commands
```

❌ **Don't ignore warnings**
```bash
# If Luminous Nix warns about security
# Read it carefully and consider implications
```

❌ **Don't skip previews**
```bash
# Using --yes blindly is dangerous
# Only use when you trust the operation
```

❌ **Don't delete all generations**
```bash
# Keep at least one previous generation
# In case current one has issues
```

## Next Steps

**Now that you're a Luminous Nix power user:**

- 🎙️ [Try voice interface](voice.md)
- ⚡ [Explore advanced features](advanced.md)
- 🔧 [Contribute to development](development.md)
- 💬 [Join the community](../community/index.md)
- 🧘 [Learn the philosophy](../philosophy/index.md)

---

*"Natural language for NixOS - speak your intention, we handle the complexity."* 💜

*Last updated: November 14, 2025*

[Back to Luminous Nix](index.md) | [Quick Start](quickstart.md) | [FAQ](faq.md)
