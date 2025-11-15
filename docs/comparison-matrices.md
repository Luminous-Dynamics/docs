# Visual Comparison Matrices

**Quick-scan comparisons to help you evaluate Luminous Dynamics products.**

---

## Overview

This page provides at-a-glance comparison matrices for quick evaluation. For detailed comparisons with full context, see:

- [Luminous Nix Detailed Comparisons](luminous-nix/comparisons.md)
- [Terra Lumina Detailed Comparisons](terra-lumina/comparisons.md)

---

## Luminous Nix vs. Traditional Package Managers

### Quick Feature Comparison

| Feature | Luminous Nix | apt | dnf | pacman | Homebrew |
|---------|--------------|-----|-----|--------|----------|
| **Interface** | Natural language | Commands | Commands | Commands | Commands |
| **Voice control** | ✅ | ❌ | ❌ | ❌ | ❌ |
| **Learning curve** | Very low | Medium | Medium | High | Low |
| **Rollback** | ✅ Easy | ❌ | ⚠️ Limited | ❌ | ❌ |
| **Reproducibility** | ✅✅ Perfect | ❌ | ⚠️ | ⚠️ | ⚠️ |
| **Multi-version** | ✅ | ❌ | ⚠️ Modules | ❌ | ⚠️ |
| **Safety previews** | ✅ | ❌ | ❌ | ❌ | ❌ |
| **Speed** | ⚠️ Slower (AI) | ✅ | ✅ | ✅✅ Fastest | ✅ |
| **Disk usage** | ⚠️ Higher | ✅ | ✅ | ✅ | ✅ |
| **Package count** | 80,000+ | 100,000+ | 50,000+ | 80,000+ | 40,000+ |
| **Cross-platform** | Linux/NixOS | Debian/Ubuntu | RHEL/Fedora | Arch | macOS |
| **Enterprise support** | Q2 2026 | ✅ | ✅ | Community | Community |

**Legend:**
- ✅✅ Excellent
- ✅ Good
- ⚠️ Limited/Conditional
- ❌ Not available

### Use Case Fit Matrix

| Use Case | Luminous Nix | apt | dnf | pacman | brew | Winner |
|----------|--------------|-----|-----|--------|------|--------|
| Personal desktop | ✅✅ | ✅ | ✅ | ✅ | ✅ | **Tie** |
| Development env | ✅✅ | ✅ | ✅ | ✅ | ✅ | **Luminous Nix** (reproducibility) |
| Production servers | ✅ | ✅✅ | ✅✅ | ⚠️ | ❌ | **apt/dnf** (mature) |
| Team consistency | ✅✅ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | **Luminous Nix** |
| Voice control needed | ✅✅ | ❌ | ❌ | ❌ | ❌ | **Luminous Nix** (only option) |
| Maximum speed | ⚠️ | ✅ | ✅ | ✅✅ | ✅ | **pacman** |
| Minimal disk | ⚠️ | ✅✅ | ✅✅ | ✅✅ | ✅ | **Traditional** |
| Disaster recovery | ✅✅ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | **Luminous Nix** (rollback) |
| Learning Linux | ✅✅ | ⚠️ | ⚠️ | ⚠️ | N/A | **Luminous Nix** (easier) |

### Command Comparison Matrix

| Task | Luminous Nix | apt | dnf | pacman | brew |
|------|--------------|-----|-----|--------|------|
| **Install package** | `ask-nix "install vim"` | `sudo apt install vim` | `sudo dnf install vim` | `sudo pacman -S vim` | `brew install vim` |
| **Remove package** | `ask-nix "remove vim"` | `sudo apt remove vim` | `sudo dnf remove vim` | `sudo pacman -R vim` | `brew uninstall vim` |
| **Update system** | `ask-nix "update system"` | `sudo apt update && sudo apt upgrade` | `sudo dnf upgrade` | `sudo pacman -Syu` | `brew upgrade` |
| **Search packages** | `ask-nix "search for editors"` | `apt search editor` | `dnf search editor` | `pacman -Ss editor` | `brew search editor` |
| **Show package info** | `ask-nix "info about vim"` | `apt show vim` | `dnf info vim` | `pacman -Si vim` | `brew info vim` |
| **List installed** | `ask-nix "what's installed?"` | `apt list --installed` | `dnf list installed` | `pacman -Q` | `brew list` |
| **Rollback change** | `ask-nix "rollback"` | Manual snapshots | Manual | ❌ | ❌ |
| **Multi-step setup** | `ask-nix "[full description]"` | Chain commands | Chain commands | Chain commands | Chain commands |

**Complexity score (lower = easier):**
- Luminous Nix: 1 (natural language)
- Homebrew: 2 (simple syntax)
- apt: 3 (sudo + flags)
- dnf: 3 (sudo + flags)
- pacman: 4 (cryptic flags)

---

## Terra Lumina vs. Traditional Investments

### Quick Feature Comparison

| Feature | Terra Lumina | S&P 500 | Bonds | REITs | ESG Funds |
|---------|--------------|---------|-------|-------|-----------|
| **Expected return** | 7-13% | ~10% avg | 2-6% | 6-14% | 8-12% |
| **Liquidity** | 10-year hold | Daily | Varies | Daily | Daily |
| **Minimum** | $10 | $1 (fractional) | $1,000 | $1 (fractional) | $1 (fractional) |
| **Volatility** | Low | High | Low | Moderate | High |
| **Direct impact** | ✅✅ | ❌ | ❌ | ❌ | ⚠️ |
| **Community benefit** | ✅✅ | ❌ | ❌ | ❌ | ❌ |
| **Tax efficiency** | ⚠️ Ordinary income | ✅ Cap gains | ✅✅ Muni | ⚠️ | ✅ |
| **Diversification** | Self-directed | ✅✅ Auto | ✅ | ✅ | ✅✅ |
| **IRA compatible** | Q3 2026 | ✅ | ✅ | ✅ | ✅ |
| **Uncorrelated to stocks** | ✅✅ | ❌ | ⚠️ | ⚠️ | ❌ |

### Return Scenarios (10-Year, $10,000 invested)

| Scenario | Terra Lumina | S&P 500 | Bonds | REITs |
|----------|--------------|---------|-------|-------|
| **Optimistic** | $33,822 (13%) | $31,058 (12%) | $16,289 (5%) | $37,072 (14%) |
| **Realistic** | $25,937 (10%) | $25,937 (10%) | $14,802 (4%) | $25,937 (10%) |
| **Pessimistic** | $19,672 (7%) | $12,190 (2%)* | $12,190 (2%) | $14,802 (4%) |

*S&P 500 pessimistic includes market crash volatility - actual path would be very turbulent

**Volatility (standard deviation):**
- Terra Lumina: 5% (very stable)
- Bonds: 7% (stable)
- REITs: 22% (volatile)
- S&P 500: 18% (volatile)

**Sharpe Ratio (risk-adjusted returns - higher is better):**
1. Terra Lumina: 1.40
2. Corporate Bonds: 0.43
3. S&P 500: 0.44
4. REITs: 0.36

### Use Case Fit Matrix

| Investor Profile | Terra Lumina | Stocks | Bonds | REITs | ESG Funds | Best Fit |
|------------------|--------------|--------|-------|-------|-----------|----------|
| **Need liquidity** | ❌ | ✅✅ | ✅ | ✅✅ | ✅✅ | **Stocks/REITs** |
| **Want impact** | ✅✅ | ❌ | ❌ | ❌ | ⚠️ | **Terra Lumina** |
| **Stable returns** | ✅✅ | ❌ | ✅✅ | ⚠️ | ❌ | **Terra Lumina/Bonds** |
| **Maximum returns** | ⚠️ | ✅✅ | ❌ | ✅ | ✅ | **Stocks** |
| **Risk-averse** | ✅ | ❌ | ✅✅ | ⚠️ | ⚠️ | **Bonds** |
| **Impact transparency** | ✅✅ | ❌ | ❌ | ❌ | ⚠️ | **Terra Lumina** |
| **Passive investing** | ⚠️ | ✅✅ | ✅ | ✅✅ | ✅✅ | **Index Funds** |
| **10+ year horizon** | ✅✅ | ✅ | ✅ | ✅ | ✅ | **Terra Lumina** (unique exit) |
| **Retirement income** | ✅✅ | ⚠️ | ✅✅ | ✅ | ⚠️ | **Terra Lumina/Bonds** |

### Portfolio Allocation Matrix

**Recommended allocations by investor type:**

| Investor Type | Stocks | Bonds | Terra Lumina | REITs | Cash |
|---------------|--------|-------|--------------|-------|------|
| **Conservative (Age 60+)** | 35% | 35% | 20% | 5% | 5% |
| **Moderate (Age 40-60)** | 50% | 20% | 20% | 5% | 5% |
| **Aggressive (Age 20-40)** | 60% | 10% | 20% | 5% | 5% |
| **Impact-Focused (Any age)** | 30% | 10% | 50% | 5% | 5% |
| **Income-Focused (Retirees)** | 25% | 30% | 35% | 5% | 5% |

**Why these allocations work:**
- Terra Lumina provides stable returns uncorrelated to stock market
- 10-year lock-up balanced by liquid stocks/bonds
- Higher allocation possible for impact-focused investors
- Income-focused can use Terra Lumina's 7-13% distributions

---

## Platform Comparison: Terra Lumina vs. Alternatives

### vs. Other Renewable Energy Platforms

| Feature | Terra Lumina | Mosaic | Wunder | Regional Platforms |
|---------|--------------|--------|--------|--------------------|
| **Investment type** | Equity | Debt | Debt | Varies |
| **Returns** | 7-13% | 4-7% | 5-8% | 5-10% |
| **Timeline** | 10 years | 5 years | 5-7 years | Varies |
| **Minimum** | $10 | $25 | $1,000 | $100-1,000 |
| **Liquidity** | Limited | Limited | Limited | Limited |
| **Geographic** | Global | US | US | Region-specific |
| **Technology** | Solar/Wind/Hydro/Storage | Solar | Commercial Solar | Varies |
| **Community ownership exit** | ✅ | ❌ | ❌ | ⚠️ Some |
| **Impact reporting** | ✅✅ Detailed | ✅ | ✅ | ⚠️ Varies |

**Key differentiators:**
- **Terra Lumina:** Only platform with regenerative community ownership exit
- **Mosaic:** Good for shorter-term solar loans to homeowners
- **Wunder:** Commercial focus, higher minimums
- **Regional:** Deep local knowledge, limited to one region

### vs. ESG/Impact Funds

| Feature | Terra Lumina | ESG Index | Impact Fund | Green Bond |
|---------|--------------|-----------|-------------|------------|
| **Impact transparency** | ✅✅ Direct | ⚠️ Indirect | ⚠️ Varies | ✅ |
| **Greenwashing risk** | ❌ None | ⚠️⚠️ High | ⚠️ Moderate | ⚠️ Low |
| **Direct ownership** | ✅ Physical assets | ❌ Stocks | ❌ Stocks | ❌ Debt |
| **Liquidity** | 10-year | Daily | Daily | Varies |
| **Returns** | 7-13% | 8-12% | 6-10% | 2-5% |
| **Fees** | 1% | 0.2-0.8% | 1-2% | 0.5-1% |
| **Community benefit** | ✅✅ | ❌ | ❌ | ❌ |
| **Due diligence** | Self-directed | Fund manager | Fund manager | Bond issuer |

**Terra Lumina advantages:**
- 100% verifiable impact (you own the solar farm)
- No greenwashing (physical renewable energy assets)
- Community ownership outcome (unique)

**ESG/Impact fund advantages:**
- Daily liquidity (can sell anytime)
- Passive management (no project research)
- Broader diversification (hundreds of holdings)

---

## Decision Matrix: Which Tool/Investment?

### Quick Decision Guide

Answer 3 questions to find your best fit:

**Question 1: What's your primary goal?**
- Easier system management → Luminous Nix
- Investment returns + impact → Terra Lumina
- Understanding philosophy → Read Philosophy docs

**Question 2: Can you commit?**
- 10 years (investment) → Terra Lumina viable
- NixOS/Nix platform → Luminous Nix viable
- Both → Both products work
- Neither → Consider alternatives

**Question 3: What's your priority?**
- Maximum convenience → Luminous Nix (natural language)
- Maximum impact transparency → Terra Lumina (direct ownership)
- Maximum liquidity → Traditional investments
- Maximum speed → Traditional package managers

### Comparison Summary Table

| Aspect | Luminous Nix | Terra Lumina | Traditional Tools | Traditional Investments |
|--------|--------------|--------------|-------------------|------------------------|
| **Ease of use** | ✅✅ Easiest | ⚠️ Moderate | ⚠️ Harder | ✅ Easy (index funds) |
| **Unique features** | Voice, Natural language | Community exit | None | Liquidity |
| **Commitment** | NixOS/Nix | 10 years | None | Varies |
| **Learning curve** | Low | Moderate | Moderate-High | Low-Moderate |
| **Enterprise ready** | Q3 2026 | Now (individuals) | ✅ | ✅ |
| **Cost** | Free (open source) | 1% fee | Free | 0-2% fees |
| **Philosophy alignment** | ✅✅ Consciousness-first | ✅✅ Regenerative | ⚠️ Varies | ⚠️ Extraction-focused |

---

## Migration Complexity Matrix

### Luminous Nix Migration Effort

| From | To Luminous Nix | Timeline | Complexity | Risk |
|------|----------------|----------|------------|------|
| **Ubuntu (apt)** | Medium | 2-4 weeks | ⚠️ Moderate | Low |
| **Fedora (dnf)** | Medium | 2-4 weeks | ⚠️ Moderate | Low |
| **Arch (pacman)** | Medium | 2-4 weeks | ⚠️ Moderate | Low |
| **macOS (brew)** | High (VM or wait) | 4-8 weeks | ⚠️⚠️ High | Medium |
| **NixOS (nix)** | Very Easy | 1-3 days | ✅ Low | Very Low |
| **Windows** | Not yet (Q4 2026) | N/A | N/A | N/A |

**Complexity factors:**
- Low: Add Luminous Nix to existing Nix
- Moderate: Learn NixOS + Luminous Nix
- High: Platform change (macOS → NixOS VM)

### Terra Lumina Migration Effort

| From | To Terra Lumina | Timeline | Complexity | Tax Implications |
|------|----------------|----------|------------|------------------|
| **Stock portfolio** | Medium | 6-12 months | ⚠️ Moderate | ⚠️⚠️ Capital gains |
| **Bond portfolio** | Easy | 3-6 months | ✅ Low | ⚠️ Moderate |
| **REIT portfolio** | Easy | 3-6 months | ✅ Low | ⚠️⚠️ Capital gains |
| **ESG funds** | Easy | 3-6 months | ✅ Low | ⚠️⚠️ Capital gains |
| **New capital** | Very Easy | Immediate | ✅ Very Low | ✅ None |
| **IRA/401(k)** | Not yet (Q3 2026) | N/A | N/A | N/A |

**Tax optimization tips:**
- Use new capital (no taxes)
- Sell gradually over 12 months
- Harvest tax losses to offset gains
- Time sales during low-income years

---

## Performance Metrics Comparison

### Luminous Nix Performance

| Metric | Luminous Nix | apt | dnf | pacman | brew |
|--------|--------------|-----|-----|--------|------|
| **Install 10 packages** | 42s | 18s | 25s | 12s | 22s |
| **Memory usage** | 300MB | 50MB | 80MB | 30MB | 100MB |
| **Disk space** | 10GB+ | 500MB | 1GB | 800MB | 2GB |
| **Command parsing** | 2-3s (AI) | Instant | Instant | Instant | Instant |
| **Rollback time** | 10s | N/A | N/A | N/A | N/A |

**Trade-off:**
- Luminous Nix slower but **way easier** to use
- Traditional faster but require **memorizing syntax**
- For most users: Convenience > 20-30 seconds

### Terra Lumina Performance

| Metric | Terra Lumina | S&P 500 | Bonds | REITs |
|--------|--------------|---------|-------|-------|
| **Historical volatility** | 5% | 18% | 7% | 22% |
| **Sharpe ratio** | 1.40 | 0.44 | 0.43 | 0.36 |
| **Max drawdown** | -5% | -50% | -15% | -70% |
| **Correlation to S&P** | 0.05 | 1.00 | 0.20 | 0.75 |
| **Distribution yield** | 7-13% | 2% | 3-5% | 4-6% |

**Key insight:**
- Terra Lumina: Lower volatility + higher distributions = better risk-adjusted returns
- Stocks: Higher volatility + potential for higher total returns = higher risk

---

## Summary Matrix: Which Product Is Right For You?

| Your Profile | Use Luminous Nix | Use Terra Lumina | Use Both |
|--------------|------------------|------------------|----------|
| **Linux developer** | ✅✅ | ⚠️ If you invest | ✅ |
| **DevOps engineer** | ✅✅ | ⚠️ If you invest | ✅ |
| **Impact investor** | ⚠️ If on Linux | ✅✅ | ✅ |
| **Retirement investor** | ⚠️ If on Linux | ✅✅ | ✅ |
| **macOS user** | ⚠️ Wait Q2 2026 | ✅✅ | ⚠️ Later |
| **Windows user** | ⚠️ Wait Q4 2026 | ✅✅ | ⚠️ Later |
| **Philosophy-aligned** | ✅ | ✅ | ✅✅ Ideal |
| **Enterprise IT** | ⚠️ Wait Q3 2026 | ⚠️ Foundation/endowment | ⚠️ |
| **Student/learner** | ✅ | ✅ Start small | ✅ |

---

## Interactive Comparison

**Still deciding? Try our interactive tools:**

- [Decision Trees](decision-trees.md) - Step-by-step guidance
- [Luminous Nix Detailed Comparisons](luminous-nix/comparisons.md) - Full context
- [Terra Lumina Detailed Comparisons](terra-lumina/comparisons.md) - Full context
- [Migration Guides](documentation-map.md#migration-guides) - Transition help

**Talk to real users:**
- [Discord Community](https://discord.gg/luminous) - Ask questions
- [Case Studies](case-studies.md) - See real outcomes
- [Discussions](community/discussions.md) - Browse conversations

---

*Compare honestly. Choose wisely. We're here to help.* 💜

[Back to Documentation Map](documentation-map.md) | [Decision Trees](decision-trees.md)
