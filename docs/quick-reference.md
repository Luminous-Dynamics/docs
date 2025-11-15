# Quick Reference

Fast lookup guides for Luminous Nix and Terra Lumina.

[:material-download: Download PDF](#) · [:material-printer: Print-friendly version](#)

---

## Luminous Nix Quick Reference

### Common Commands

| Task | Command |
|------|---------|
| **Package Management** ||
| Install package | `ask-nix "install firefox"` |
| Remove package | `ask-nix "remove firefox"` |
| Search packages | `ask-nix "search for video editors"` |
| List installed | `ask-nix "what packages are installed?"` |
| Update system | `ask-nix "update all packages"` |
| **Services** ||
| Enable service | `ask-nix "enable docker service"` |
| Disable service | `ask-nix "disable bluetooth"` |
| Restart service | `ask-nix "restart nginx"` |
| Check status | `ask-nix "is docker running?"` |
| **System Info** ||
| Disk space | `ask-nix "how much disk space do I have?"` |
| Memory usage | `ask-nix "show memory usage"` |
| System info | `ask-nix "what version of nixos am I running?"` |
| Network info | `ask-nix "what's my IP address?"` |
| **Configuration** ||
| Edit config | `luminous-nix config edit` |
| View config | `luminous-nix config list` |
| Set value | `luminous-nix config set llm.provider ollama` |
| **Voice** ||
| Start voice | `luminous-nix voice` |
| Test microphone | `luminous-nix voice --test-mic` |
| Setup voice | `luminous-nix voice --setup` |

### Configuration File

```yaml
# ~/.config/luminous-nix/config.yaml

# LLM Settings
llm:
  provider: ollama              # or "openai"
  model: llama2                 # model name
  ollama_url: http://localhost:11434
  # openai_api_key: "sk-..."   # if using OpenAI

# Voice Settings
voice:
  enabled: true
  wake_word: "hey nix"          # optional
  tts_voice: "en_US-lessac-medium"
  energy_threshold: 300         # mic sensitivity

# Safety
safety:
  require_confirmation: true
  dry_run_default: false
```

### Natural Language Patterns

**Luminous Nix understands variations:**

```bash
# All of these mean the same thing:
ask-nix "install firefox"
ask-nix "I want to use Firefox"
ask-nix "add Firefox browser to my system"
ask-nix "get me firefox please"
```

**Multi-step requests:**

```bash
ask-nix "install docker, enable it, and add me to the docker group"
ask-nix "set up a Python development environment with pip and virtualenv"
```

### Troubleshooting Quick Fixes

| Problem | Solution |
|---------|----------|
| Command not found | `export PATH="$HOME/.nix-profile/bin:$PATH"` |
| Ollama not responding | `systemctl --user start ollama` |
| Permission denied | Add `sudo` for system operations |
| Voice not working | `luminous-nix voice --test-mic` |
| Slow responses | Use smaller LLM model (`llama2:7b`) |

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+C` | Cancel current operation |
| `Ctrl+D` | Exit voice mode |
| `--help` | Show command help |
| `--version` | Show version |
| `-v` | Verbose output |
| `-y` | Skip confirmations |

---

## Terra Lumina Quick Reference

### Investment Process

| Step | Action | Time |
|------|--------|------|
| 1. Sign up | Create account at terralumina.org | 2 min |
| 2. KYC | Upload ID and selfie | 10 min |
| 3. Browse | Explore projects | 5-30 min |
| 4. Invest | Choose amount ($10 min) | 2 min |
| 5. Track | Monitor via dashboard | Ongoing |

### Project Evaluation (Five Pillars)

| Pillar | What to Check |
|--------|---------------|
| **Financial** | ✓ Realistic returns<br>✓ Clear revenue model<br>✓ Third-party validation |
| **Technical** | ✓ Proven technology<br>✓ Reputable suppliers<br>✓ Technical due diligence |
| **Community** | ✓ Local support<br>✓ Job creation<br>✓ Clear exit plan |
| **Risk** | ✓ Identified risks<br>✓ Mitigation strategies<br>✓ Insurance coverage |
| **Values** | ✓ Transparency<br>✓ Community ownership<br>✓ Environmental impact |

### Portfolio Construction

**Beginner ($500):**
```
40% - Operating projects (low risk)
40% - Construction projects (medium risk)
20% - Planning projects (higher risk/return)

Spread across:
- 3+ technologies
- 2+ countries
```

**Intermediate ($5,000):**
```
50% - Operating (stable returns)
30% - Construction (growth)
20% - Planning/emerging (high potential)

Diversify:
- 5+ projects
- 4+ technologies
- 3+ countries
```

**Advanced ($25,000+):**
```
60% - Operating (income focus)
25% - Construction (balanced)
15% - Planning/emerging (growth)

Advanced diversification:
- 10+ projects
- All technologies
- 5+ countries
- Stage diversification
- Geographic balancing
```

### Expected Returns by Technology

| Technology | Typical Return | Risk Level |
|------------|----------------|------------|
| Solar | 8-12% | Low-Medium |
| Wind (onshore) | 9-13% | Medium |
| Wind (offshore) | 10-14% | Medium-High |
| Hydro | 7-11% | Low |
| Storage | 10-15% | Medium-High |
| Nuclear SMR | 12-18% | High |

### Investment Timeline

```
Day 0:    Invest
Day 0-3:  Payment processing
Day 3-7:  Ownership tokens minted
Quarter 1: First distribution (if operating project)
Year 10:  Exit to community ownership
```

### Key Metrics to Monitor

| Metric | Meaning | Good Sign |
|--------|---------|-----------|
| Funding % | Project capital raised | 50%+ shows momentum |
| Investor count | Number of backers | More = diversified support |
| Rating | Community/expert score | 4+ stars |
| Return % | Expected annual return | 8-13% typical |
| Exit timeline | Years to community transfer | 7-10 years standard |

### Payment Methods

| Method | Processing Time | Fees |
|--------|-----------------|------|
| Credit/Debit Card | Instant | ~3% |
| ACH Bank Transfer | 1-3 days | Free |
| Wire Transfer | 1 day | $10-30 |
| Cryptocurrency | 1-2 hours | ~2% |

### Distribution Claims

```bash
# Typical flow:
1. Distribution becomes available (quarterly/annual)
2. Email notification sent
3. Log in to claim distribution
4. Choose payment method
5. Receive funds (3-5 business days)

# Minimum distribution: $1.00
# Smaller amounts accumulate until threshold
```

### Troubleshooting Quick Fixes

| Problem | Solution |
|---------|----------|
| KYC rejected | Retake photos in good lighting |
| Investment unavailable | Project may be fully funded |
| Payment failed | Contact bank about international transaction |
| Can't claim distribution | Check if minimum ($1) reached |
| Missing distribution | Check spam folder for emails |

---

## Emergency Contacts

### Luminous Nix

**Technical Issues:**
- Discord: [#troubleshooting](https://discord.gg/luminous)
- Email: dev@luminousdynamics.org
- GitHub: [Issues](https://github.com/Luminous-Dynamics/luminous-nix/issues)

### Terra Lumina

**Account/Investment:**
- Email: support@luminousdynamics.org
- Response: < 4 hours (urgent), < 24 hours (general)

**Security Issues:**
- Email: security@luminousdynamics.org
- Phone: [Contact page](https://terralumina.org/contact)

---

## Useful Links

**Luminous Nix:**
- [Quick Start](luminous-nix/quickstart.md)
- [User Guide](luminous-nix/user-guide.md)
- [FAQ](luminous-nix/faq.md)
- [API Reference](luminous-nix/api.md)

**Terra Lumina:**
- [Getting Started](terra-lumina/getting-started.md)
- [Investment Guide](terra-lumina/investment-guide.md)
- [Projects](terra-lumina/projects.md)
- [FAQ](terra-lumina/faq.md)

**General:**
- [Troubleshooting](troubleshooting.md)
- [Glossary](glossary.md)
- [Roadmap](roadmap.md)
- [Case Studies](case-studies.md)

---

## Tips & Best Practices

### Luminous Nix

✅ **Do:**
- Start with simple commands
- Use natural language (don't memorize syntax)
- Review preview before confirming
- Try voice control for hands-free operation
- Use local LLM for privacy

❌ **Don't:**
- Run commands without understanding them
- Disable safety checks (until experienced)
- Use OpenAI API key on shared systems
- Expect perfect understanding (it's AI, clarify when needed)

### Terra Lumina

✅ **Do:**
- Start small ($10-100) to learn
- Diversify across projects and technologies
- Read all project documentation
- Claim distributions promptly
- Track portfolio performance

❌ **Don't:**
- Invest more than you can afford to lose
- Put all money in one project
- Skip due diligence
- Ignore risk factors
- Expect guaranteed returns

---

## Version Information

| Product | Current Version | Release Date |
|---------|----------------|--------------|
| Luminous Nix | v1.0.x | November 11, 2025 |
| Terra Lumina | v1.0.x | Operating since 2025 |
| Documentation | Updated | November 15, 2025 |

---

## Keyboard Shortcuts & Aliases

### Luminous Nix

```bash
# Aliases (add to ~/.bashrc or ~/.zshrc)
alias nix="luminous-nix"
alias ask="ask-nix"
alias nixv="luminous-nix voice"
alias nixc="luminous-nix config"

# Usage:
ask "install vim"
nixv  # Start voice mode
nixc edit  # Edit config
```

### Shell Integration

```bash
# Fish shell
abbr --add nix luminous-nix
abbr --add ask ask-nix

# Zsh
alias nix='luminous-nix'
alias ask='ask-nix'
```

---

## Print-Friendly Summary

### Luminous Nix One-Liner

```
Natural language → System management
ask-nix "what you want" → it happens
```

### Terra Lumina One-Liner

```
$10 minimum → Renewable energy → Returns → Community ownership
Invest → Earn → Transfer → Lasting impact
```

---

*Last updated: November 15, 2025*

[Back to Home](index.md) | [Getting Started](getting-started.md) | [Full Documentation](#)

**Print this page:** Press Ctrl+P (Cmd+P on Mac)
