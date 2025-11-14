# Quick Start Guide

Get up and running with Luminous Nix in under 10 minutes.

## Prerequisites

Before you begin, ensure you have:

- **NixOS 23.05 or later** (check with `nixos-version`)
- **4GB RAM minimum** (8GB recommended for voice features)
- **500MB free disk space**
- **Internet connection** for initial model download

!!! info "Not on NixOS yet?"
    Luminous Nix is designed specifically for NixOS. If you're new to NixOS, check out the [official installation guide](https://nixos.org/download.html) first.

## Installation

### Option 1: Quick Install (Recommended)

```bash
# Download and install in one command
curl -L https://github.com/Luminous-Dynamics/luminous-nix/releases/latest/download/install.sh | sh
```

The installer will:

1. Download the latest Luminous Nix binary
2. Install it to `/usr/local/bin/luminous-nix`
3. Set up shell completion
4. Download the AI model (may take 2-5 minutes)
5. Run a system check

### Option 2: Manual Install

```bash
# Download the binary
curl -L https://github.com/Luminous-Dynamics/luminous-nix/releases/latest/download/luminous-nix -o luminous-nix

# Make it executable
chmod +x luminous-nix

# Move to PATH
sudo mv luminous-nix /usr/local/bin/

# Verify installation
luminous-nix --version
```

### Option 3: Build from Source

```bash
# Clone the repository
git clone https://github.com/Luminous-Dynamics/luminous-nix.git
cd luminous-nix

# Build with Nix
nix-build

# Or use the development shell
nix-shell
```

## Initial Setup

### 1. Run First-Time Setup

```bash
luminous-nix setup
```

This interactive wizard will:

- Configure your AI model preferences
- Set up voice input (optional)
- Choose your verbosity level
- Test your installation

### 2. Verify Everything Works

```bash
# Run a simple test
luminous-nix ask "what is my NixOS version?"
```

You should see Luminous Nix understand your question and respond with your system information.

## Your First Commands

### Searching for Packages

Instead of remembering package names, just describe what you want:

```bash
luminous-nix ask "find a markdown editor"
luminous-nix ask "I need a tool to edit videos"
luminous-nix ask "show me python packages for web development"
```

### Installing Software

Natural language installation:

```bash
luminous-nix ask "install firefox"
luminous-nix ask "I want to use git"
luminous-nix ask "add vim and tmux to my system"
```

!!! warning "Review Before Applying"
    Luminous Nix will always show you the proposed changes before modifying your system. You'll see a preview and must confirm before any changes are applied.

### System Configuration

Ask for configuration help:

```bash
luminous-nix ask "enable docker"
luminous-nix ask "how do I set up printing?"
luminous-nix ask "configure my firewall to allow SSH"
```

### Development Environments

Create development shells instantly:

```bash
luminous-nix ask "create a python development environment"
luminous-nix ask "I need a rust dev shell with cargo"
luminous-nix ask "set up node.js for web development"
```

## Interactive Mode

For multiple commands, use interactive mode:

```bash
# Start interactive mode
luminous-nix

# Now you can chat naturally
> find web browsers
> install the most popular one
> also add a password manager
> show me what will change
> apply these changes
```

## Using the Alias

For convenience, we recommend creating a short alias:

```bash
# Add to your ~/.bashrc or ~/.zshrc
alias ask='luminous-nix ask'
alias nix-chat='luminous-nix'

# Now you can use:
ask "install htop"
```

## Voice Control (Optional)

If you enabled voice during setup:

```bash
# Start voice mode
luminous-nix voice

# Now speak your commands naturally:
# "Install Firefox"
# "Show me my installed packages"
# "Create a Python dev environment"
```

Press `Ctrl+Space` to start listening, speak your command, then Luminous Nix will process and respond.

## Understanding the Output

Luminous Nix shows you three types of information:

### 1. Understanding Confirmation
```
🧠 I understand you want to: install Firefox web browser
```

### 2. Proposed Changes
```
📋 Proposed changes:
  + firefox (will add to systemPackages)

💾 This will modify: /etc/nixos/configuration.nix
```

### 3. Safety Checks
```
✅ This change is safe and reversible
⚠️  This will require a system rebuild (2-3 minutes)
```

## Common Patterns

### Just Exploring

```bash
ask "what programming languages are available?"
ask "show me popular text editors"
ask "what can I do with Nix?"
```

### Fixing Issues

```bash
ask "why isn't my audio working?"
ask "how do I fix broken dependencies?"
ask "my wifi isn't connecting"
```

### Learning NixOS

```bash
ask "explain what a flake is"
ask "how do system generations work?"
ask "what's the difference between environment.systemPackages and users.users.X.packages?"
```

## Troubleshooting

### "Command not found"

Your PATH might not include `/usr/local/bin`. Try:

```bash
# Use full path
/usr/local/bin/luminous-nix --version

# Or add to PATH
export PATH="/usr/local/bin:$PATH"
```

### "Model download failed"

Check your internet connection and try:

```bash
luminous-nix setup --reinstall-model
```

### "Permission denied" when making changes

Luminous Nix needs sudo access to modify system configuration:

```bash
# Run with sudo when applying changes
sudo luminous-nix ask "install firefox" --apply
```

### AI responses seem inaccurate

The local model might need updating:

```bash
luminous-nix update-model
```

Or try a different model:

```bash
luminous-nix setup --model mistral
```

### Voice input not working

Check that your microphone is detected:

```bash
luminous-nix voice --test-mic
```

## Next Steps

Now that you're up and running:

- 📖 Read the [User Guide](user-guide.md) for in-depth features
- 🎙️ Set up [Voice Interface](voice.md) for hands-free operation
- ⚙️ Learn [Advanced Features](advanced.md) for power users
- ❓ Check the [FAQ](faq.md) for common questions
- 💬 Join our [Discord community](https://discord.gg/luminous)

## Quick Reference Card

```bash
# Basic commands
luminous-nix ask "your question"          # Ask anything
luminous-nix                              # Interactive mode
luminous-nix voice                        # Voice mode
luminous-nix setup                        # Reconfigure
luminous-nix --help                       # Show all options

# Common tasks
ask "install [package]"                   # Install software
ask "search for [description]"            # Find packages
ask "enable [service]"                    # Configure services
ask "create [language] dev environment"   # Dev shells
ask "why is [thing] broken?"             # Troubleshooting
ask "explain [concept]"                   # Learn NixOS

# Safety
ask "show me what will change"            # Preview only
ask "install X" --dry-run                 # Simulate
ask "rollback last change"                # Undo
```

## Getting Help

If you get stuck:

1. **Check the FAQ**: [faq.md](faq.md)
2. **Ask Luminous Nix**: `ask "how do I [your question]?"`
3. **Community**: [GitHub Discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
4. **Discord**: [discord.gg/luminous](https://discord.gg/luminous)
5. **Email**: support@luminousdynamics.org

---

*Happy NixOS-ing! May your system configurations be declarative and your rollbacks unnecessary.* 🌟
