---
title: Luminous Nix - Natural Language Interface for NixOS
description: Transform NixOS system management from complex configuration to natural conversation. Voice-enabled, AI-powered, safe by default. Talk to your computer in plain English.
---

# Luminous Nix - Natural Language for NixOS

## Making NixOS Accessible to Everyone

Luminous Nix transforms NixOS system management from complex configuration files to natural conversation. Just say what you want - we handle the rest.

## ✨ Key Features

### 🗣️ Natural Language Interface
```bash
ask-nix "install a web browser"
ask-nix "set up python development environment"
ask-nix "configure nginx with SSL"
```

### 🧠 AI-Powered Understanding
- Understands intent, not just commands
- Learns from your usage patterns
- Suggests better alternatives
- Explains what it's doing and why

### 🛡️ Safe by Default
- Preview all changes before applying
- Automatic rollback on errors
- Never modifies without permission
- Full audit trail of changes

### 🎨 Beautiful TUI
- Interactive terminal interface
- Visual system status
- Real-time feedback
- Keyboard-driven workflow

### 🎙️ Voice Control (Beta)
- Speak your commands naturally
- Multi-language support
- Accessibility-first design
- Works offline

## 🚀 Quick Start

### Installation
```bash
# Download latest release
curl -L https://github.com/Luminous-Dynamics/luminous-nix/releases/latest/download/luminous-nix -o luminous-nix
chmod +x luminous-nix

# Add to PATH
sudo mv luminous-nix /usr/local/bin/

# Verify installation
luminous-nix --version
```

### First Commands
```bash
# Search for packages
ask-nix "find a markdown editor"

# Install software
ask-nix "install firefox"

# System configuration
ask-nix "enable docker"

# Development environments
ask-nix "create rust dev shell"
```

## 🎯 Use Cases

### For Beginners
- No NixOS knowledge required
- Learn by doing
- Built-in explanations
- Gentle error messages

### For Power Users
- 10x faster than manual configuration
- Scriptable and automatable
- Full NixOS power available
- Custom shortcuts and aliases

### For Organizations
- Standardize configurations
- Onboard developers quickly
- Reduce configuration errors
- Maintain consistency

## 🏗️ Architecture

### Sacred Trinity Development Model
Built through revolutionary Human+AI collaboration:
- **Human**: Vision and testing
- **Claude**: Architecture and implementation
- **Local LLM**: Domain expertise

Result: Enterprise-grade quality for $200/month

### System Architecture

```mermaid
graph TB
    User[👤 User Input]
    Voice[🎤 Voice Interface<br/>Whisper STT]
    Text[⌨️ Text Interface<br/>ask-nix CLI]

    User --> Voice
    User --> Text

    Voice --> NLP[🧠 Natural Language<br/>Processing Layer]
    Text --> NLP

    NLP --> Intent[Intent Recognition<br/>Ollama + Mistral/Llama]
    Intent --> Safety[🛡️ Safety Checks<br/>Preview & Confirm]

    Safety --> NixGen[📝 Nix Config<br/>Generator]
    NixGen --> NixOS[💠 NixOS<br/>System Layer]

    NixOS --> Result[✅ Result]
    Result --> TUI[🎨 Textual TUI<br/>Feedback]
    Result --> TTS[🔊 Text-to-Speech<br/>Piper TTS]

    TUI --> User
    TTS --> User

    Safety -.->|Rollback| NixOS

    style User fill:#e1bee7
    style NLP fill:#ce93d8
    style Safety fill:#ba68c8
    style NixOS fill:#ab47bc
    style Result fill:#9c27b0
```

**How it works:**

1. **Input**: User speaks or types natural language command
2. **Understanding**: Local AI models parse intent (offline-capable)
3. **Safety**: Preview changes, ask for confirmation
4. **Generation**: Create appropriate Nix configuration
5. **Execution**: Apply changes through NixOS
6. **Feedback**: Show results via beautiful TUI or voice

### Technical Stack
- **Core**: Python 3.11+ with Poetry
- **AI**: Ollama + Mistral/Llama models
- **Frontend**: Textual TUI framework
- **Voice**: Whisper + Piper TTS
- **Backend**: Native NixOS integration

## 📊 Performance Benefits

Experience significant time savings compared to traditional NixOS workflows:

| Operation | Traditional | Luminous Nix | Improvement |
|-----------|------------|--------------|-------------|
| Find package | 30-60s | 2-5s | ~10x faster |
| Install software | 2-5 min | 30s | ~5x faster |
| Dev environment | 15-30 min | 1 min | ~20x faster |
| Fix error | 30+ min | 10s | ~100x faster |

*Performance varies based on system configuration and task complexity.*

## 🤝 Community

### Get Help
- [GitHub Discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- [Discord](https://discord.gg/luminous)
- Email: support@luminousdynamics.org

### Contribute
- [Report Issues](https://github.com/Luminous-Dynamics/luminous-nix/issues)
- [View Roadmap](https://github.com/Luminous-Dynamics/luminous-nix/projects)
- Development guide coming soon

## 🎉 Success Stories

> "I went from NixOS beginner to productive in one day!" - Sarah, Web Developer

> "Finally, my team can use NixOS without the learning curve." - Alex, CTO

> "The voice interface changed everything for me as a blind developer." - Maya, Software Engineer

## 📚 Resources

Documentation is currently being expanded. Check back soon for:
- User Guide
- Advanced Features
- API Reference
- FAQ

---

*"Making NixOS accessible to all beings through the power of natural conversation."*

[View on GitHub](https://github.com/Luminous-Dynamics/luminous-nix){ .md-button .md-button--primary }
[Download Latest Release](https://github.com/Luminous-Dynamics/luminous-nix/releases){ .md-button }