# Printable Quick Reference Guide

**Luminous Dynamics Quick Reference - Print & Save**

> This page is optimized for printing. Use your browser's print function (Ctrl+P / Cmd+P) to save as PDF.

---

## Luminous Nix Quick Reference

### Installation

```bash
# NixOS
nix-env -iA nixpkgs.luminous-nix

# Configure
luminous-nix config set llm.provider ollama
```

### Essential Commands

| Task | Command |
|------|---------|
| Install package | `ask-nix "install firefox"` |
| Remove package | `ask-nix "remove firefox"` |
| Update system | `ask-nix "update system"` |
| Search packages | `ask-nix "search for video editors"` |
| List installed | `ask-nix "what packages are installed?"` |
| System info | `ask-nix "show system info"` |
| Rollback | `ask-nix "rollback to previous state"` |
| Enable service | `ask-nix "enable docker service"` |

### Voice Interface

```bash
# Enable voice
luminous-nix voice --setup

# Start voice interface
luminous-nix voice

# Wake word: "Hey Nix"
```

### Multi-Step Examples

```bash
# Set up development environment
ask-nix "install nodejs, python3, docker, and git. Enable docker and add me to docker group"

# Server setup
ask-nix "install nginx, enable it, and configure basic website"

# Maintenance
ask-nix "update system, clean up old packages, and show disk usage"
```

### Configuration File Location

```
~/.config/luminous-nix/config.yaml
```

### Common Options

```yaml
llm:
  provider: ollama  # or "openai"
  model: llama2

voice:
  enabled: true
  wake_word: "hey nix"

safety:
  require_confirmation: true
  dry_run_default: false
```

### Troubleshooting

| Issue | Solution |
|-------|----------|
| Command not understood | Rephrase more specifically |
| Slow responses | Use smaller LLM model (7B) |
| Permission denied | Use `sudo ask-nix` for system changes |
| Voice not working | Check microphone with `luminous-nix voice --test-mic` |

### Help Resources

- Documentation: docs.luminousdynamics.org/luminous-nix/
- Quick Start: docs.luminousdynamics.org/luminous-nix/quickstart/
- Discord: discord.gg/luminous
- GitHub: github.com/Luminous-Dynamics/luminous-nix

---

## Terra Lumina Quick Reference

### Getting Started

1. Create account: terralumina.org/signup
2. Complete KYC verification (~10 minutes)
3. Browse projects: Use Five Pillar framework
4. Invest: Minimum $10

### Five Pillar Evaluation Framework

**Evaluate each project:**

1. **Financial Pillar** ⭐⭐⭐⭐⭐
   - Realistic revenue projections?
   - Third-party validation?
   - Conservative assumptions?

2. **Technical Pillar** ⭐⭐⭐⭐⭐
   - Proven technology?
   - Reputable suppliers?
   - Technical due diligence done?

3. **Community Pillar** ⭐⭐⭐⭐⭐
   - Local support?
   - Job creation?
   - Transition plan ready?

4. **Risk Pillar** ⭐⭐⭐⭐⭐
   - Risks identified and disclosed?
   - Mitigation strategies?
   - Insurance coverage?

5. **Values Pillar** ⭐⭐⭐⭐⭐
   - Transparent reporting?
   - Community ownership commitment?
   - Environmental impact positive?

**Rating:** 20+ stars = Excellent, 15-19 = Good, <15 = Reconsider

### Investment Process

```
Browse → Evaluate (5 Pillars) → Invest ($10+) →
Receive Distributions → Monitor Progress →
Year 10: Community Ownership Transfer
```

### Portfolio Allocation Guidelines

| Portfolio Size | Conservative | Moderate | Aggressive |
|----------------|--------------|----------|------------|
| $10K | 2-5% | 5-10% | 10-15% |
| $50K | 5-10% | 10-15% | 15-25% |
| $250K | 10-15% | 15-25% | 25-40% |
| $1M | 10-20% | 20-30% | 30-40% |

### Diversification Strategy

**Minimum 5-10 projects across:**

- **Geography:** US 30%, Europe 25%, Latin America 25%, Africa 20%
- **Technology:** Solar 40%, Wind 30%, Hydro 20%, Storage 10%
- **Stage:** Operating 50%, Construction 30%, Planning 20%

### Expected Returns

- **Range:** 7-13% annually
- **Timeline:** 10 years
- **Distributions:** Quarterly or annual
- **Exit:** Ownership transfers to community

### Risk Management

**Before investing:**
- [ ] Read full project documentation
- [ ] Evaluate using Five Pillars
- [ ] Check third-party audit reports
- [ ] Understand specific risks
- [ ] Confirm 10-year commitment

**Diversification minimums:**
- At least 5 different projects
- At least 2 different technologies
- At least 2 different geographies
- Mix of project stages

### Help Resources

- Documentation: docs.luminousdynamics.org/terra-lumina/
- Investment Guide: docs.luminousdynamics.org/terra-lumina/investment-guide/
- Discord: discord.gg/luminous
- Email: invest@luminousdynamics.org

---

## Consciousness-First Principles

### Five Pillars

1. **Respect Attention** - No dark patterns, no manipulation
2. **Amplify Capability** - Enhance what you can do
3. **Maintain Transparency** - Clear about how things work
4. **Enable Sovereignty** - You own and control your data
5. **Serve Wellbeing** - Optimize for human flourishing

### Seven Harmonies

1. **Human-First Harmony** - Serve consciousness, not metrics
2. **Simplicity Harmony** - Natural over complex
3. **Transparency Harmony** - Open over hidden
4. **Sovereignty Harmony** - Local over cloud
5. **Community Harmony** - Shared benefit over extraction
6. **Sustainability Harmony** - Long-term over short-term
7. **Joy Harmony** - Delight over addiction

### Sacred Trinity Development

**Human (Conscious):** Vision, values, judgment
**Claude AI (Capable):** Reasoning, code generation
**Local LLM (Sovereign):** Privacy, offline capability

**Result:** $200/month vs $4.2M traditional development cost

---

## Essential Links

### Documentation
- **Main Docs:** docs.luminousdynamics.org
- **Getting Started:** docs.luminousdynamics.org/getting-started/
- **Documentation Map:** docs.luminousdynamics.org/documentation-map/
- **Decision Trees:** docs.luminousdynamics.org/decision-trees/
- **Tutorials:** docs.luminousdynamics.org/tutorials/

### Community
- **Discord:** discord.gg/luminous
- **GitHub:** github.com/Luminous-Dynamics
- **Discussions:** github.com/orgs/Luminous-Dynamics/discussions

### Support
- **General:** info@luminousdynamics.org
- **Support:** support@luminousdynamics.org
- **Investment:** invest@luminousdynamics.org
- **Enterprise:** enterprise@luminousdynamics.org

### Products
- **Luminous Nix:** github.com/Luminous-Dynamics/luminous-nix
- **Terra Lumina:** terralumina.org
- **Documentation:** docs.luminousdynamics.org

---

## Quick Decision Guide

### "Which product should I use?"

**Choose Luminous Nix if:**
- ✅ You use Linux/NixOS
- ✅ You're tired of memorizing commands
- ✅ You want voice control
- ✅ You need easy rollback
- ✅ You value reproducibility

**Choose Terra Lumina if:**
- ✅ You want 7-13% returns
- ✅ You can commit for 10 years
- ✅ You want direct impact
- ✅ You value community benefit
- ✅ You have $10+ to invest

**Use Both if:**
- ✅ You're a developer AND impact investor
- ✅ You align with consciousness-first values
- ✅ You want comprehensive conscious tech

### "Which migration strategy?"

**Luminous Nix Migration:**
- **Gradual** (2-4 weeks): Keep current tools, add Luminous Nix slowly
- **Complete** (3-7 days): Fresh NixOS install with Luminous Nix
- **Parallel** (1-2 weeks): Try in VM first, then decide

**Terra Lumina Migration:**
- **Gradual** (6-12 months): Sell existing holdings slowly
- **Direct** (3-6 months): Sell portion, invest immediately
- **New Capital** (ongoing): Use new investments only
- **Dedicated** (1-2 months): Separate impact bucket

---

## Command Cheat Sheet

### Luminous Nix vs Traditional

| Traditional | Luminous Nix |
|------------|--------------|
| `sudo apt install vim` | `ask-nix "install vim"` |
| `sudo systemctl enable docker` | `ask-nix "enable docker"` |
| `df -h` | `ask-nix "show disk usage"` |
| `journalctl -xe` | `ask-nix "show recent logs"` |
| `ufw allow 80/tcp` | `ask-nix "allow port 80"` |

### Configuration Templates

**Luminous Nix config.yaml:**
```yaml
llm:
  provider: ollama
  model: llama2

voice:
  enabled: true
  wake_word: "hey nix"

safety:
  require_confirmation: true
```

**Terra Lumina Portfolio (Example $10K):**
```
Solar Projects: $4,000 (40%)
Wind Projects: $3,000 (30%)
Hydro Projects: $2,000 (20%)
Storage: $1,000 (10%)

Geographic:
US: $3,000 (30%)
Europe: $2,500 (25%)
Latin America: $2,500 (25%)
Africa: $2,000 (20%)
```

---

## Emergency Troubleshooting

### Luminous Nix Issues

**"Command not working"**
1. Rephrase more specifically
2. Check LLM is running: `ollama ps`
3. Check config: `luminous-nix config show`
4. Restart: `systemctl --user restart luminous-nix`

**"Voice not responding"**
1. Test mic: `luminous-nix voice --test-mic`
2. Check wake word: Say clearly "Hey Nix"
3. Adjust threshold in config
4. Check audio permissions

**"System broke after command"**
```bash
# Immediate rollback
ask-nix "rollback to previous system state"

# Or manual
sudo nixos-rebuild switch --rollback
```

### Terra Lumina Issues

**"Can't access account"**
1. Reset password: terralumina.org/reset
2. Check email for verification
3. Contact: support@luminousdynamics.org

**"Distribution not received"**
1. Check project distribution schedule
2. Verify payment method on file
3. Check spam folder (email notification)
4. Contact: invest@luminousdynamics.org

**"Need to exit early"**
- Hardship redemption available
- Contact invest@luminousdynamics.org
- Provide documentation of hardship
- Fair value redemption (not guaranteed)

---

## Print Instructions

**To save this as PDF:**

1. **Chrome/Edge:** Ctrl+P (Cmd+P on Mac) → Save as PDF
2. **Firefox:** Ctrl+P → Print to PDF
3. **Safari:** Cmd+P → PDF → Save as PDF

**Print tips:**
- Use landscape orientation for tables
- Enable background colors for better readability
- Consider double-sided printing to save paper
- Print only sections you need

---

## Version Information

**Document version:** 1.0
**Last updated:** November 16, 2025
**Based on:** Documentation Phase 12
**Products:**
- Luminous Nix v1.0 (released 11/11/25)
- Terra Lumina (operating)

**For latest updates:** docs.luminousdynamics.org

---

*This quick reference is part of the complete Luminous Dynamics documentation.*
*Full documentation: docs.luminousdynamics.org*
*License: CC BY 4.0*

---

**Made with 💜 by humans who believe technology can serve consciousness**
