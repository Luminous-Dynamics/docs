---
title: Luminous Nix Command Builder - Natural Language Examples
description: Interactive guide to building natural language commands for Luminous Nix. Learn patterns, see examples, and generate commands for common tasks. Master system management through conversation.
---

# Luminous Nix Command Builder

**Learn to craft effective natural language commands for Luminous Nix.**

!!! tip "Natural Language Power"
    Luminous Nix understands intent, not just keywords. These patterns help you communicate clearly, but feel free to phrase things naturally!

---

## Quick Command Generator

### Basic Pattern

```
ask-nix "[action] [target] [optional: context/constraints]"
```

**Examples:**
```bash
ask-nix "install firefox"
ask-nix "remove old packages"
ask-nix "update system"
```

---

## Command Patterns by Task

### 1. Package Management

#### Installation Commands

**Pattern:** `"install [package name]"`

```bash
# Simple installation
ask-nix "install firefox"
ask-nix "install visual studio code"
ask-nix "install docker"

# With specifications
ask-nix "install the latest version of python"
ask-nix "install firefox developer edition"
ask-nix "install postgresql version 15"

# Multiple packages
ask-nix "install vim, git, and curl"
ask-nix "install development tools for rust"

# By description
ask-nix "install a markdown editor"
ask-nix "install a video player with codec support"
ask-nix "install tools for web development"
```

#### Removal Commands

**Pattern:** `"remove [package name]"` or `"uninstall [package name]"`

```bash
# Simple removal
ask-nix "remove firefox"
ask-nix "uninstall docker"

# With cleanup
ask-nix "remove firefox and clean up dependencies"
ask-nix "uninstall all unused packages"

# By category
ask-nix "remove all games"
ask-nix "uninstall development tools I'm not using"
```

#### Search Commands

**Pattern:** `"search for [description]"` or `"find [description]"`

```bash
# By name
ask-nix "search for firefox"
ask-nix "find packages containing 'video'"

# By function
ask-nix "search for markdown editors"
ask-nix "find tools for music production"
ask-nix "search for python development packages"

# By feature
ask-nix "find video players that support mkv"
ask-nix "search for editors with vim bindings"
```

#### Update Commands

**Pattern:** `"update [target]"`

```bash
# System updates
ask-nix "update system"
ask-nix "update all packages"
ask-nix "update and reboot"

# Specific packages
ask-nix "update firefox"
ask-nix "update python to latest version"

# With constraints
ask-nix "update all packages except the kernel"
ask-nix "update only security patches"
```

---

### 2. System Configuration

#### Service Management

**Pattern:** `"[action] [service] service"`

```bash
# Enable/disable services
ask-nix "enable docker service"
ask-nix "disable bluetooth service"
ask-nix "enable ssh server"

# Start/stop services
ask-nix "start postgresql service"
ask-nix "stop nginx"
ask-nix "restart apache"

# Check status
ask-nix "show status of docker service"
ask-nix "is ssh running?"
ask-nix "what services are enabled?"
```

#### User Management

**Pattern:** `"[action] user [username]"`

```bash
# Create users
ask-nix "create user alice"
ask-nix "add user bob with sudo access"
ask-nix "create developer user for team"

# Modify users
ask-nix "add alice to docker group"
ask-nix "give bob admin privileges"
ask-nix "change my shell to zsh"

# List users
ask-nix "list all users"
ask-nix "show users with sudo access"
```

#### Network Configuration

**Pattern:** `"configure network [specification]"`

```bash
# WiFi
ask-nix "connect to wifi network HomeNetwork"
ask-nix "show available wifi networks"
ask-nix "disconnect from wifi"

# Firewall
ask-nix "enable firewall"
ask-nix "allow port 8080"
ask-nix "open ports for web server"

# DNS
ask-nix "set dns to 1.1.1.1"
ask-nix "configure cloudflare dns"
```

---

### 3. Development Environments

#### Language Environments

**Pattern:** `"set up [language] development environment"`

```bash
# Single language
ask-nix "set up python development environment"
ask-nix "create rust dev environment"
ask-nix "configure nodejs for development"

# With specific versions
ask-nix "set up python 3.11 environment"
ask-nix "create node 18 development setup"

# With tools
ask-nix "set up python with virtualenv and poetry"
ask-nix "create rust environment with cargo and clippy"
ask-nix "configure go with gopls and debugging tools"
```

#### Development Shells

**Pattern:** `"create [type] dev shell"`

```bash
# Quick shells
ask-nix "create python dev shell"
ask-nix "start temporary rust environment"
ask-nix "give me a shell with nodejs and npm"

# Project-specific
ask-nix "create dev shell for web development"
ask-nix "set up machine learning environment"
ask-nix "create shell for game development"

# With specific tools
ask-nix "create shell with gcc, cmake, and gdb"
ask-nix "give me python with pandas, numpy, and jupyter"
```

---

### 4. System Information & Monitoring

#### Status Queries

**Pattern:** `"show [information type]"`

```bash
# System status
ask-nix "show system info"
ask-nix "what's my system status?"
ask-nix "show disk usage"
ask-nix "show memory usage"

# Package info
ask-nix "what packages are installed?"
ask-nix "show recently installed packages"
ask-nix "what version of python is installed?"

# Service info
ask-nix "what services are running?"
ask-nix "show failed services"
ask-nix "list all enabled services"
```

#### Diagnostic Commands

**Pattern:** `"check [component] [optional: for problems]"`

```bash
# Health checks
ask-nix "check system health"
ask-nix "check for broken packages"
ask-nix "check disk space"

# Performance
ask-nix "show cpu usage"
ask-nix "what's using memory?"
ask-nix "show network activity"

# Logs
ask-nix "show recent errors"
ask-nix "show logs for docker service"
ask-nix "what failed during last boot?"
```

---

### 5. Maintenance & Cleanup

#### Cleanup Commands

**Pattern:** `"clean up [target]"`

```bash
# General cleanup
ask-nix "clean up old packages"
ask-nix "remove unused dependencies"
ask-nix "free up disk space"

# Specific cleanup
ask-nix "clean package cache"
ask-nix "remove old generations"
ask-nix "delete temporary files"

# Optimization
ask-nix "optimize system"
ask-nix "rebuild system configuration"
ask-nix "run garbage collection"
```

#### Rollback Commands

**Pattern:** `"rollback [optional: to generation]"`

```bash
# Simple rollback
ask-nix "rollback"
ask-nix "undo last change"
ask-nix "go back to previous state"

# Specific generation
ask-nix "rollback to generation 42"
ask-nix "restore yesterday's configuration"
ask-nix "show available generations to rollback to"

# Inspection
ask-nix "what changed in last update?"
ask-nix "show differences from previous generation"
```

---

## Advanced Command Patterns

### 1. Conditional Commands

**Pattern:** `"[action] if [condition]"`

```bash
# Conditional actions
ask-nix "update system if no critical services running"
ask-nix "install docker if not already installed"
ask-nix "restart nginx if configuration changed"

# With constraints
ask-nix "update packages except kernel if uptime > 7 days"
ask-nix "clean up packages if disk usage > 80%"
```

### 2. Multi-Step Commands

**Pattern:** `"[action 1], then [action 2]"`

```bash
# Sequential actions
ask-nix "update system, then reboot"
ask-nix "install docker, then enable the service"
ask-nix "backup configuration, then update"

# Complex workflows
ask-nix "create user alice, add to wheel group, then set shell to zsh"
ask-nix "install nodejs, set up project environment, then start dev server"
```

### 3. Contextual Commands

**Pattern:** `"[action] for [context]"`

```bash
# Project-specific
ask-nix "set up environment for my web project"
ask-nix "install dependencies for this directory"
ask-nix "configure services for production deployment"

# Role-specific
ask-nix "set up system for development work"
ask-nix "configure server for hosting websites"
ask-nix "prepare system for machine learning"
```

---

## Voice Command Adaptations

### Natural Spoken Patterns

Voice commands can be more conversational:

```bash
# Spoken naturally
"Hey computer, install Firefox for me"
"Can you update the system?"
"Show me what's using all the memory"
"I need Python development tools"

# Questions
"What version of Node is installed?"
"Is Docker running?"
"How much disk space do I have?"
"What packages did I install yesterday?"

# Casual requests
"Get me ready for React development"
"Fix whatever's broken"
"Make everything up to date"
"Clean up old stuff I don't need"
```

### Voice-Optimized Patterns

```bash
# Clear pronunciation
ask-nix "install firefox"  # Clear, distinct words
ask-nix "update all packages"  # Avoid mumbling
ask-nix "show system status"  # Enunciate

# Avoid ambiguity
ask-nix "install VS Code"  # vs "BS code" mishearing
ask-nix "enable SSH service"  # vs "S S H" individual letters
ask-nix "show disk usage"  # vs "disc usage"
```

---

## Command Templates by Role

### For Developers

```bash
# Daily workflow
ask-nix "update development tools"
ask-nix "start my usual dev environment"
ask-nix "show git status for all projects"

# Project setup
ask-nix "create fresh development shell for web project"
ask-nix "set up CI/CD tools"
ask-nix "install testing frameworks for python"

# Troubleshooting
ask-nix "why is my build failing?"
ask-nix "check nodejs version conflicts"
ask-nix "show logs for development services"
```

### For System Administrators

```bash
# Maintenance
ask-nix "update all systems"
ask-nix "audit installed packages"
ask-nix "check security updates"

# Monitoring
ask-nix "show service status overview"
ask-nix "what's consuming resources?"
ask-nix "show failed login attempts"

# Configuration
ask-nix "apply server hardening settings"
ask-nix "configure backup automation"
ask-nix "set up monitoring stack"
```

### For DevOps Engineers

```bash
# Deployment
ask-nix "deploy application to staging"
ask-nix "configure nginx for multiple sites"
ask-nix "set up docker compose environment"

# Infrastructure
ask-nix "provision database server"
ask-nix "configure kubernetes node"
ask-nix "set up CI runner"

# Monitoring
ask-nix "show deployment status"
ask-nix "check container health"
ask-nix "show metrics for last hour"
```

---

## Command Composition Strategies

### 1. Start Simple, Add Details

```bash
# Step 1: Basic intent
ask-nix "install python"

# Step 2: Add version
ask-nix "install python 3.11"

# Step 3: Add tools
ask-nix "install python 3.11 with pip and virtualenv"

# Step 4: Add configuration
ask-nix "install python 3.11 with pip and virtualenv, set as default"
```

### 2. Use Natural Language Flow

```bash
# Good: Natural
ask-nix "install docker and enable the service to start on boot"

# Also good: Conversational
ask-nix "I need docker installed and running automatically"

# Avoid: Too terse (but still works)
ask-nix "docker install enable"
```

### 3. Be Specific When Needed

```bash
# Vague (may prompt for clarification)
ask-nix "install editor"

# Specific
ask-nix "install vim text editor"

# Very specific
ask-nix "install neovim version 0.9 with python support"
```

---

## Common Pitfalls & Solutions

### Pitfall 1: Ambiguous References

❌ **Ambiguous:**
```bash
ask-nix "install it"  # What is "it"?
ask-nix "update that thing"  # What thing?
```

✅ **Clear:**
```bash
ask-nix "install firefox"
ask-nix "update the nodejs package"
```

### Pitfall 2: Over-Complex Commands

❌ **Too Complex:**
```bash
ask-nix "install docker, enable it, start it, add my user, configure registry, set up compose, and install portainer, then restart"
```

✅ **Break It Down:**
```bash
ask-nix "install and set up docker for my user"
# Then separately:
ask-nix "install portainer"
```

### Pitfall 3: Assuming Context

❌ **Assumes Context:**
```bash
ask-nix "use the new one"  # New what?
ask-nix "fix the error"  # Which error?
```

✅ **Provide Context:**
```bash
ask-nix "use nodejs version 20"
ask-nix "fix the docker service startup error"
```

---

## Quick Reference Cheat Sheet

| Task | Command Pattern | Example |
|------|----------------|---------|
| **Install** | `install [package]` | `install firefox` |
| **Remove** | `remove [package]` | `remove firefox` |
| **Search** | `search for [description]` | `search for video editors` |
| **Update** | `update [target]` | `update system` |
| **Enable Service** | `enable [service]` | `enable docker service` |
| **Start Service** | `start [service]` | `start nginx` |
| **Dev Environment** | `set up [language] dev environment` | `set up python dev environment` |
| **System Info** | `show [info type]` | `show system status` |
| **Rollback** | `rollback` or `undo last change` | `rollback to generation 42` |
| **Cleanup** | `clean up [target]` | `clean up old packages` |

---

## Practice Exercises

### Beginner Level

Try these commands to get comfortable:

1. Install your favorite browser
2. Search for text editors
3. Show system information
4. Update all packages
5. Check what services are running

### Intermediate Level

Practice more complex tasks:

1. Set up a development environment for your language of choice
2. Enable and start a service (like docker or nginx)
3. Create a user and add them to groups
4. Configure your firewall to allow specific ports
5. Roll back a recent change

### Advanced Level

Master complex workflows:

1. Create a complete development setup with multiple tools
2. Configure services with specific settings
3. Set up conditional commands
4. Troubleshoot a system issue using diagnostic commands
5. Build a multi-step deployment workflow

---

## Getting Help

### Built-In Help

```bash
# General help
ask-nix "help"
ask-nix "show me what you can do"

# Specific topics
ask-nix "help with installing packages"
ask-nix "how do I set up development environments?"
ask-nix "what commands work for services?"

# Examples
ask-nix "show examples of search commands"
ask-nix "give me examples for rollback"
```

### Learning Resources

- **[User Guide](user-guide.md)** - Comprehensive usage documentation
- **[Tutorials](../tutorials.md)** - Step-by-step walkthroughs
- **[FAQ](faq.md)** - Common questions answered
- **[Voice Interface Guide](voice.md)** - Voice-specific tips

---

## Next Steps

**Master Luminous Nix:**

1. **[Quick Start](quickstart.md)** - Get started in 15 minutes
2. **[User Guide](user-guide.md)** - Complete documentation
3. **[Advanced Features](advanced.md)** - Power user capabilities
4. **[Join Discord](https://discord.gg/luminous)** - Ask questions, share tips

---

*Remember: Luminous Nix understands natural language. Don't overthink it—just say what you want to do!*

**Last updated:** November 16, 2025
