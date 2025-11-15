# Advanced Features

Power user guide to advanced Luminous Nix capabilities, customization, and integration.

## Overview

This guide covers advanced features for experienced NixOS users who want to extend Luminous Nix, optimize workflows, and integrate with existing tools.

**Prerequisites:** Familiarity with [User Guide](user-guide.md) and basic NixOS concepts.

## Custom LLM Integration

### Using Different Models

Luminous Nix supports multiple local LLM backends:

#### Ollama (Default)

```bash
# List available models
ollama list

# Pull a specific model
ollama pull mistral:latest
ollama pull llama3.1:8b
ollama pull phi3:medium

# Configure Luminous Nix to use it
luminous-nix config set model "mistral:latest"
```

#### LM Studio

```bash
# Start LM Studio server
lmstudio server start

# Configure Luminous Nix
luminous-nix config set llm_backend "lmstudio"
luminous-nix config set llm_endpoint "http://localhost:1234"
```

#### GPT4All

```bash
# Configure for GPT4All
luminous-nix config set llm_backend "gpt4all"
luminous-nix config set model_path "/path/to/model.gguf"
```

### Model Comparison

| Model | Speed | Accuracy | RAM | Best For |
|-------|-------|----------|-----|----------|
| **phi-3** | ⚡⚡⚡ | ★★★ | 4GB | Quick queries, low-end hardware |
| **mistral** | ⚡⚡ | ★★★★ | 8GB | Balanced performance (default) |
| **llama-3.1-8b** | ⚡⚡ | ★★★★★ | 12GB | Best accuracy, slower |
| **command-r** | ⚡ | ★★★★ | 16GB | Complex tasks |

### Fine-Tuning for NixOS

Create a NixOS-specific fine-tuned model:

```bash
# Collect your NixOS configurations as training data
luminous-nix export-training-data

# Fine-tune with your data (requires GPU)
luminous-nix fine-tune \
  --base-model mistral \
  --training-data ~/.config/luminous-nix/training-data.jsonl \
  --output custom-nix-model

# Use your custom model
luminous-nix config set model custom-nix-model
```

**Benefits:**

- Better understanding of your specific setup
- Faster responses for your common patterns
- Custom package recommendations
- Learns your preferences

## NixOS Integration

### Flakes Support

Full support for Nix Flakes:

```bash
# Enable flakes in Luminous Nix
luminous-nix config set nix_features '["flakes", "nix-command"]'

# Work with flakes
ask-nix "add flake input nixpkgs"
ask-nix "update flake locks"
ask-nix "show flake outputs"
```

**Flake-specific commands:**

```bash
# Create new flake
ask-nix "initialize a flake for this system"

# Add input
ask-nix "add home-manager to my flake"

# Update specific input
ask-nix "update nixpkgs flake input"

# Build flake configuration
ask-nix "rebuild using flake"
```

### Home Manager Integration

Manage user environment with Home Manager:

```bash
# Install Home Manager
ask-nix "set up home manager"

# Configure user packages
ask-nix "add vim to my home manager config"

# Manage dotfiles
ask-nix "configure git with home manager"

# User services
ask-nix "enable syncthing for my user"
```

**Home Manager vs System Packages:**

Luminous Nix understands the difference:

```bash
# System-wide (in configuration.nix)
ask-nix "install firefox system-wide"

# User-specific (in home.nix)
ask-nix "install firefox for my user only"
```

### NixOS Modules

Work with custom modules:

```bash
# Import a module
ask-nix "import module from /path/to/module.nix"

# Create custom module
ask-nix "create a module for my custom service"

# List imported modules
ask-nix "show my custom modules"
```

### Overlays

Manage Nix overlays:

```bash
# Add overlay
ask-nix "create overlay to patch firefox"

# List overlays
ask-nix "show active overlays"

# Remove overlay
ask-nix "remove overlay for firefox"
```

## Automation & Scripting

### Bash Integration

Create powerful shell scripts:

```bash
#!/usr/bin/env bash

# Automated system setup script
set -e

# Function to run Luminous Nix non-interactively
lnix() {
    luminous-nix ask "$1" --yes --quiet
}

echo "Setting up development environment..."

# Install packages
lnix "install git vim tmux"

# Enable services
lnix "enable docker"

# Create dev shells
lnix "create python dev environment"
lnix "create rust dev environment"

# Configure system
lnix "enable bluetooth"
lnix "set hostname to devmachine"

echo "Setup complete!"
```

### Systemd Integration

Run Luminous Nix tasks on schedule:

```nix
# Add to configuration.nix
systemd.services.auto-update = {
  description = "Automatic system update";
  serviceConfig = {
    Type = "oneshot";
    ExecStart = ''
      ${pkgs.luminous-nix}/bin/luminous-nix ask "update everything" --yes
    '';
  };
};

systemd.timers.auto-update = {
  wantedBy = [ "timers.target" ];
  timerConfig = {
    OnCalendar = "weekly";
    Persistent = true;
  };
};
```

```bash
# Enable with Luminous Nix
ask-nix "enable the auto-update timer"
```

### CI/CD Integration

Use in GitLab CI, GitHub Actions, etc.:

```yaml
# .github/workflows/nixos-test.yml
name: Test NixOS Configuration

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Install Nix
        uses: cachix/install-nix-action@v20

      - name: Install Luminous Nix
        run: |
          curl -L https://.../install.sh | sh

      - name: Test Configuration
        run: |
          luminous-nix ask "validate my configuration" --json
```

## Performance Tuning

### Parallel Builds

Speed up package compilation:

```bash
# Enable parallel builds
ask-nix "set nix to use 8 cores for building"

# Configure in configuration.nix:
nix.settings = {
  cores = 8;
  max-jobs = 4;
};
```

### Binary Caches

Use binary caches to avoid rebuilding:

```bash
# Add Cachix cache
ask-nix "add cachix cache nix-community"

# Add custom cache
ask-nix "add binary cache at https://cache.example.com"

# Trust cache
ask-nix "trust binary cache nix-community"
```

### Store Optimization

Optimize Nix store regularly:

```bash
# Auto-optimize after each operation
luminous-nix config set auto_optimize true

# Manual optimization
ask-nix "optimize nix store"

# Hard-link identical files
nix-store --optimise
```

### Garbage Collection Automation

```bash
# Auto-GC when disk usage is high
luminous-nix config set auto_gc true
luminous-nix config set gc_threshold_gb 20

# Keep only recent generations
ask-nix "keep only last 7 days of generations"
```

## Custom Prompts & Templates

### Prompt Engineering

Customize how Luminous Nix interprets requests:

```yaml
# ~/.config/luminous-nix/prompts.yaml
custom_prompts:
  dev_setup: |
    When user says "dev setup for X":
    - Install X language and tooling
    - Create appropriate dev shell
    - Set up LSP and formatters
    - Configure git hooks if relevant

  clean_system: |
    When user says "clean system":
    - Run garbage collection
    - Remove old generations (keep last 5)
    - Optimize store
    - Clear caches
```

Usage:

```bash
ask-nix "dev setup for rust"
# Executes custom dev_setup prompt with X=rust

ask-nix "clean system"
# Executes custom clean_system workflow
```

### Command Aliases

Create shorthand for complex operations:

```yaml
# ~/.config/luminous-nix/aliases.yaml
aliases:
  update: "update package channels and rebuild system"
  clean: "run garbage collection and optimize store"
  backup: "export configuration to /backup/nixos"
  docker-setup: "install docker, enable service, add user to docker group"
```

```bash
# Use alias
ask-nix "update"  # Expands to full command
```

### Response Templates

Customize Luminous Nix responses:

```yaml
# ~/.config/luminous-nix/templates.yaml
templates:
  success:
    - "✓ Done! {operation} completed successfully."
    - "All set! {operation} is ready to use."

  error:
    - "Oops! {operation} failed: {error}"
    - "Couldn't complete {operation}. Error: {error}"

  confirmation:
    - "This will {operation}. Continue? [y/N]"
    - "About to {operation}. Proceed? [y/N]"
```

## Plugin System

### Creating Plugins

Extend Luminous Nix with Python plugins:

```python
# ~/.config/luminous-nix/plugins/my_plugin.py
from luminous_nix.plugin import Plugin

class MyPlugin(Plugin):
    """Custom plugin for X functionality"""

    def register(self):
        """Called when plugin loads"""
        self.register_command("deploy", self.deploy)
        self.register_hook("pre_install", self.backup_config)

    def deploy(self, args):
        """Custom deploy command"""
        print("Deploying configuration...")
        # Your logic here

    def backup_config(self, context):
        """Pre-install hook"""
        # Backup before installing
        pass
```

**Enable plugin:**

```bash
luminous-nix plugin enable my_plugin
```

### Official Plugins

```bash
# List available plugins
luminous-nix plugin list

# Install plugin
luminous-nix plugin install nixos-generators
luminous-nix plugin install home-manager-extras

# Example plugins:
# - nixos-generators: Build ISOs, VMs, containers
# - home-manager-extras: Extra Home Manager commands
# - nix-index: Fast package search
# - nix-tree: Visualize dependencies
```

## Remote Management

### SSH Integration

Manage remote NixOS systems:

```bash
# Configure remote host
luminous-nix remote add server user@example.com

# Run commands on remote
luminous-nix remote exec server "install htop"
luminous-nix remote exec server "rebuild system"

# Deploy configuration
luminous-nix remote deploy server ./configuration.nix
```

### NixOps Integration

Deploy NixOS networks:

```bash
# Create NixOps deployment
ask-nix "create nixops deployment for 3 servers"

# Deploy to all
ask-nix "deploy nixops configuration"

# Query status
ask-nix "show nixops deployment status"
```

### Colmena Integration

Deploy with Colmena:

```bash
# Initialize Colmena hive
ask-nix "create colmena hive"

# Deploy to hosts
ask-nix "deploy to web-servers tag"
```

## Security Features

### Secret Management

Integrate with sops-nix or agenix:

```bash
# Set up agenix
ask-nix "install agenix for secrets"

# Add secret
ask-nix "create agenix secret db-password"

# Use in configuration
ask-nix "reference agenix secret in postgres config"
```

### Sandboxed Operations

Run in isolated environment:

```bash
# Sandboxed install (extra paranoid)
luminous-nix ask "install untrusted-package" --sandbox

# Runs in:
# - Separate network namespace
# - No access to /home
# - Limited syscalls
```

### Audit Trail

Track all system changes:

```bash
# Enable audit logging
luminous-nix config set audit_log true

# View audit log
luminous-nix audit show

# Example output:
2025-11-14 10:30:15 | user | install firefox | SUCCESS
2025-11-14 10:35:22 | user | enable docker | SUCCESS
2025-11-14 10:40:18 | user | create python shell | SUCCESS
```

### Signing & Verification

Sign configurations for verification:

```bash
# Generate signing key
ask-nix "generate configuration signing key"

# Sign configuration
ask-nix "sign current configuration"

# Verify before applying
luminous-nix config set verify_signatures true
```

## Advanced Natural Language

### Context Windows

Maintain conversation context:

```bash
# Enable contextual understanding
luminous-nix config set context_aware true

# Now conversations flow:
ask-nix "install firefox"
ask-nix "also get chrome"  # Understands "also" refers to installation
ask-nix "remove the first one"  # Knows "first one" is firefox
```

### Custom Vocabulary

Teach Luminous Nix your terminology:

```yaml
# ~/.config/luminous-nix/vocabulary.yaml
synonyms:
  my-stack: [python, postgresql, redis, nginx]
  web-dev: [nodejs, typescript, tailwind]
  sys-tools: [htop, btop, nethogs, iotop]

abbreviations:
  pg: postgresql
  py: python
  ts: typescript
```

```bash
ask-nix "install my-stack"
# Installs python, postgresql, redis, nginx

ask-nix "set up web-dev environment"
# Creates dev shell with nodejs, typescript, tailwind
```

### Probabilistic Matching

Handle typos and variations:

```bash
# All understood despite typos:
ask-nix "instll firefix"
ask-nix "enabl docekr"
ask-nix "crete pythn shell"

# Luminous Nix:
# "Did you mean: install firefox?"
# "Did you mean: enable docker?"
# "Did you mean: create python shell?"
```

## Debugging & Development

### Debug Mode

Deep debugging information:

```bash
# Enable debug mode
luminous-nix --debug ask "install firefox"

# Shows:
# - Intent classification details
# - Entity extraction process
# - NixOS configuration parsing
# - Build plan generation
# - Each step of execution
```

### Trace Mode

Trace execution:

```bash
ask-nix "install firefox" --trace

# Outputs:
[TRACE] Parsing natural language input
[TRACE] Intent: INSTALL, Confidence: 0.97
[TRACE] Entity: firefox, Type: PACKAGE
[TRACE] Searching NixOS packages...
[TRACE] Found: firefox 124.0.2
[TRACE] Generating NixOS configuration...
[TRACE] Configuration valid
[TRACE] Asking user confirmation...
```

### Testing Configurations

Test before applying:

```bash
# Dry-run with detailed output
luminous-nix test --verbose

# Test specific scenario
luminous-nix test --scenario "install package"

# Regression testing
luminous-nix test --suite all
```

### Contributing Improvements

```bash
# Report successful interaction for training
luminous-nix feedback --success

# Report failure with context
luminous-nix feedback --failure "should have installed X not Y"

# Anonymously share usage data (helps improve accuracy)
luminous-nix config set telemetry opt-in
```

## Multi-User Setup

### Shared Configuration

Central Luminous Nix config for team:

```bash
# Point to shared config
luminous-nix config set shared_config "/etc/luminous-nix/team-config.yaml"

# Team members inherit:
# - Custom prompts
# - Aliases
# - Plugins
# - Safety settings
```

### User Profiles

Different profiles for different use cases:

```bash
# Create profiles
luminous-nix profile create development
luminous-nix profile create production

# Switch profiles
luminous-nix profile use development

# Development profile: verbose, interactive
# Production profile: quiet, auto-confirm, audit
```

## Advanced Examples

### Automated Workstation Setup

```bash
#!/usr/bin/env bash
# workstation-setup.sh

set -e

echo "Workstation Setup Starting..."

# Base system
luminous-nix ask "update package channels" --yes
luminous-nix ask "install git vim tmux htop" --yes

# Development tools
luminous-nix ask "create python dev environment" --yes
luminous-nix ask "create rust dev environment" --yes
luminous-nix ask "create nodejs dev environment" --yes

# Services
luminous-nix ask "enable docker and add user to docker group" --yes
luminous-nix ask "enable postgresql and create user database" --yes

# System config
luminous-nix ask "set hostname to $(whoami)-workstation" --yes
luminous-nix ask "enable bluetooth and audio" --yes

# Cleanup
luminous-nix ask "run garbage collection" --yes

echo "Workstation setup complete!"
```

### Infrastructure as Code

```bash
# infrastructure.nix
{ config, pkgs, ... }:

let
  # Use Luminous Nix in Nix expressions
  lnix = "${pkgs.luminous-nix}/bin/luminous-nix";
in {
  systemd.services.deploy-app = {
    script = ''
      ${lnix} ask "pull latest code from git"
      ${lnix} ask "rebuild application containers"
      ${lnix} ask "run database migrations"
      ${lnix} ask "restart application service"
    '';
  };
}
```

### Monitoring Integration

```bash
# Monitor with Prometheus
luminous-nix export-metrics --prometheus > /var/lib/prometheus/luminous-nix.prom

# Metrics include:
# - Commands executed
# - Success/failure rates
# - Response times
# - Model accuracy
# - Resource usage
```

## Tips & Tricks

### Speed Up Common Operations

```bash
# Preload model on boot
systemd.services.luminous-nix-preload = {
  wantedBy = [ "multi-user.target" ];
  script = "${pkgs.luminous-nix}/bin/luminous-nix preload-model";
};
```

### Reduce Verbosity for Scripts

```bash
# Quiet mode for scripts
export LUMINOUS_NIX_QUIET=1
ask-nix "install firefox"  # No unnecessary output
```

### Custom Keybindings

```bash
# In your WM/DE config
# Super+N: Open Luminous Nix prompt
bindsym $mod+n exec --no-startup-id "kitty luminous-nix"

# Super+Shift+N: Voice mode
bindsym $mod+Shift+n exec --no-startup-id "kitty luminous-nix voice"
```

## Troubleshooting Advanced Features

### Plugin Issues

```bash
# Debug plugin loading
luminous-nix plugin debug my-plugin

# Reinstall plugin
luminous-nix plugin reinstall my-plugin

# Check plugin logs
journalctl -u luminous-nix -g "plugin:my-plugin"
```

### Remote Connection Issues

```bash
# Test SSH connection
luminous-nix remote test server

# Verbose remote execution
luminous-nix remote exec server "rebuild" --verbose

# Check remote logs
luminous-nix remote logs server
```

### Model Performance Issues

```bash
# Profile model performance
luminous-nix benchmark

# Compare models
luminous-nix benchmark --compare phi mistral llama

# Optimize model
luminous-nix optimize-model
```

## Further Resources

- [User Guide](user-guide.md) - Fundamentals
- [Development Guide](development.md) - Contributing
- [Voice Interface](voice.md) - Voice control
- [FAQ](faq.md) - Common questions
- [API Reference](api.md) - API documentation (coming soon)

---

*"The limit is your imagination. Luminous Nix adapts to your workflow."* ⚡💜

*Last updated: November 14, 2025*

[Back to Luminous Nix](index.md)
