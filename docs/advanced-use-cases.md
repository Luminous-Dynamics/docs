# Advanced Use Cases & Examples

**Real-world advanced workflows and integrations for power users.**

---

## Overview

This page showcases advanced use cases that demonstrate the full power of Luminous Dynamics products for experienced users.

**Sections:**
- [Luminous Nix Advanced Workflows](#luminous-nix-advanced-workflows)
- [Terra Lumina Advanced Strategies](#terra-lumina-advanced-strategies)
- [Integration Examples](#integration-examples)

---

## Luminous Nix Advanced Workflows

### Use Case 1: Automated Development Environment Provisioning

**Scenario:** DevOps engineer needs to set up identical development environments for a 20-person team, each with specific tools, configurations, and permissions.

**Challenge:** Manual setup takes 4 hours per developer. Need consistency across all machines.

**Solution with Luminous Nix:**

```bash
# 1. Create reusable environment specification
cat > dev-env-spec.txt <<EOF
Set up a complete full-stack development environment:
- Install Node.js 20, Python 3.11, Go 1.21, Rust latest
- Install Docker and Docker Compose, enable service, add user to docker group
- Install PostgreSQL 15, Redis 7, and MongoDB 6
- Install VS Code with extensions: ESLint, Prettier, GitLens, Docker
- Install development tools: git, vim, tmux, htop, jq, curl
- Clone our team repositories from github.com/company/* to ~/projects/
- Set up Git with company email and GPG signing
- Configure shell with zsh, oh-my-zsh, and our custom theme
- Set up SSH keys for GitHub
- Install and configure Kubernetes tools: kubectl, helm, k9s
- Set up pre-commit hooks for code quality
EOF

# 2. Deploy to team member's machine
ask-nix "$(cat dev-env-spec.txt)"

# Output:
# I'll set up a complete full-stack development environment. This will:
# - Install 15 packages
# - Configure 4 services
# - Clone 8 repositories
# - Set up authentication (SSH, GPG)
# - Configure shell and tools
#
# Estimated time: 8-12 minutes
# Should I proceed?

> Yes

# [Progress shown in real-time]
# ✓ Installed Node.js 20.10.0
# ✓ Installed Python 3.11.6
# ✓ Installed Go 1.21.5
# ...
# ✓ Configured zsh with oh-my-zsh
# ✓ Cloned 8 repositories to ~/projects/
# ✓ Generated SSH key and added to ssh-agent
#
# Development environment ready. Total time: 9min 34s
```

**Advanced features demonstrated:**

1. **Complex multi-step workflow** - Single natural language description
2. **Service management** - Docker enabled and user added to group
3. **Repository cloning** - Batch operation across multiple repos
4. **Configuration management** - Shell, Git, SSH all configured
5. **Verification** - Each step verified before proceeding

**Team rollout:**
```bash
# Export successful config for reuse
luminous-nix export-last-config > team-dev-env.nix

# Other team members can apply:
ask-nix "apply configuration from team-dev-env.nix"

# Or share via Git:
git add team-dev-env.nix
git commit -m "Team development environment"
git push

# Team members:
git pull
ask-nix "apply team development environment configuration"
```

**Time savings:**
- Manual setup: 4 hours × 20 developers = 80 hours
- Luminous Nix: 10 minutes × 20 + 2 hours setup = 5.3 hours
- **Savings: 74.7 hours (93%)**

**Consistency benefit:**
- Manual: Each developer slightly different (errors, missed steps)
- Luminous Nix: Bit-for-bit identical across all 20 machines

---

### Use Case 2: Production Server Hardening & Compliance

**Scenario:** Security team must harden 50 production servers to meet SOC 2, ISO 27001, and PCI DSS requirements.

**Requirements:**
- Disable unnecessary services
- Configure firewall rules
- Set up audit logging
- Enforce security policies
- Configure automatic updates
- Set up intrusion detection
- Generate compliance reports

**Solution with Luminous Nix:**

```bash
# Create comprehensive hardening specification
cat > server-hardening.txt <<EOF
Harden this production server for SOC 2, ISO 27001, and PCI DSS compliance:

Security Services:
- Disable all unnecessary services (telnet, ftp, rsh, etc.)
- Enable and configure fail2ban for intrusion prevention
- Install and configure AIDE for file integrity monitoring
- Set up auditd for comprehensive audit logging
- Install and configure rkhunter for rootkit detection

Firewall Configuration:
- Configure nftables firewall:
  * Default policy: DENY all incoming
  * Allow: SSH (port 22), HTTPS (port 443), monitoring (port 9100)
  * Rate limit SSH to 3 connections per minute per IP
  * Log all denied connections
  * Enable SYN flood protection

User & Access Control:
- Enforce password complexity requirements (min 14 chars, mixed case, numbers, symbols)
- Set password expiry to 90 days
- Disable root SSH login
- Require key-based authentication for SSH
- Set up 2FA for all admin accounts
- Create separate admin account for emergency access

Logging & Monitoring:
- Configure rsyslog to forward to central SIEM at 10.0.1.100
- Enable detailed auth logs
- Set up log rotation (keep 90 days)
- Configure automatic log integrity checking
- Send critical alerts to security team

Automatic Updates:
- Configure unattended security updates
- Reboot automatically if kernel updated (weekly maintenance window: Sun 3-5 AM)
- Send update reports to ops team

System Hardening:
- Disable USB storage
- Enable ASLR and DEP
- Configure secure kernel parameters (sysctl)
- Remove unused filesystems
- Set restrictive file permissions on sensitive files
- Configure secure NTP
- Disable IPv6 if not used

Compliance Reporting:
- Generate daily compliance reports
- Check against CIS benchmarks
- Alert on any deviations from security baseline
EOF

ask-nix "$(cat server-hardening.txt)"

# Output:
# I'll harden this server for compliance with SOC 2, ISO 27001, and PCI DSS.
# This involves 78 configuration changes across 12 categories.
#
# PREVIEW OF CHANGES:
# Security Services:
#   - Disable 15 unnecessary services
#   - Install fail2ban, AIDE, auditd, rkhunter
#
# Firewall (nftables):
#   - Set default policy to DENY
#   - Add 12 firewall rules
#   - Enable rate limiting and logging
#
# [... full preview ...]
#
# COMPLIANCE IMPACT:
# - SOC 2: Will satisfy CC6.1, CC6.6, CC7.2, CC8.1
# - ISO 27001: Will satisfy A.9, A.12, A.12.4, A.18.1
# - PCI DSS: Will satisfy Req 2, Req 8, Req 10
#
# This is a significant security configuration. Generate detailed report first?

> Yes, show me the report

# [Detailed compliance report generated]
# [Review...]

> Proceed with hardening

# [All 78 changes applied systematically]
# ✓ Disabled unnecessary services (15 services)
# ✓ Configured firewall (12 rules added)
# ✓ Enabled audit logging
# ...
# ✓ Generated compliance baseline report
#
# Server hardened successfully.
# Compliance score: 96/100 (see /var/log/compliance-report.txt)
#
# Recommended next steps:
# - Review compliance report
# - Test firewall rules
# - Verify SIEM integration
# - Schedule quarterly compliance audits
```

**Rollout to entire fleet:**

```bash
# Export hardening config
luminous-nix export-last-config > production-hardening.nix

# Deploy to all 50 servers via Ansible
ansible-playbook deploy-hardening.yml

# deploy-hardening.yml:
# - name: Harden production servers
#   hosts: production
#   tasks:
#     - name: Copy hardening config
#       copy:
#         src: production-hardening.nix
#         dest: /tmp/hardening.nix
#
#     - name: Apply hardening
#       shell: ask-nix "apply configuration from /tmp/hardening.nix" -y
#
#     - name: Verify compliance
#       shell: ask-nix "generate compliance report"
#       register: compliance
#
#     - name: Fetch compliance reports
#       fetch:
#         src: /var/log/compliance-report.txt
#         dest: reports/{{ inventory_hostname }}.txt
```

**Benefits:**
- **Time:** 8 hours manual per server → 15 minutes automated = 400 hours saved
- **Consistency:** Identical hardening across all servers
- **Compliance:** Automatic verification against standards
- **Documentation:** Every change logged and reported

---

### Use Case 3: Disaster Recovery - Infrastructure Rebuild from Voice Control

**Scenario:** Data center fire destroyed primary infrastructure. CTO needs to rebuild 10 critical servers ASAP. Only has phone access (no keyboard).

**Challenge:** Need to rebuild complex infrastructure using only voice while coordinating recovery efforts.

**Solution: Voice-controlled infrastructure rebuild**

```bash
# Enable voice interface on recovery laptop
luminous-nix voice

# [Voice commands - hands-free while on phone with insurance, team, etc.]

You: "Hey Nix, I need to rebuild our production infrastructure from scratch. We had 10 servers: 3 web servers, 4 app servers, 2 database servers, and 1 monitoring server. Start with the monitoring server so we can track recovery."

Luminous Nix: "I'll help you rebuild your infrastructure. Starting with monitoring server. Should I use our standard monitoring stack with Prometheus, Grafana, and Alertmanager?"

You: "Yes, use the standard stack."

Luminous Nix: "Building monitoring server with Prometheus, Grafana, and Alertmanager. Installing necessary packages. Should I configure data retention for 90 days?"

You: "Yes, ninety days retention. Also set up alerts for disk usage, memory, and service health."

Luminous Nix: "Configuring alerts for disk usage above 80%, memory usage above 85%, and service downtime. Should I send alerts to ops at alerts@company.com?"

You: "Yes, send to that address and also to my phone at plus one five five five one two three four five six seven."

[Continues voice conversation to rebuild infrastructure]

You: "Show me the status of all rebuilt servers."

Luminous Nix: "Here's the current status:
- Monitoring server: Online, all services running
- Web server 1: Installing packages, 60% complete
- Web server 2: Installing packages, 45% complete
- Web server 3: Waiting in queue
- App servers 1-4: Waiting in queue
- Database servers 1-2: Waiting in queue

Estimated time to completion: 18 minutes."

You: "As soon as web servers are up, configure them to serve our holding page from GitHub pages while we finish recovery."

Luminous Nix: "I'll configure web servers to proxy to your GitHub Pages holding page as soon as they're ready. Should I set up automatic failover once the full stack is restored?"

You: "Yes, auto failover when databases are healthy and app servers pass health checks."

[Recovery continues...]

# 45 minutes later:

Luminous Nix: "All 10 servers rebuilt and online. Running final health checks. Database replication synced. Application servers responding to health checks. Web servers serving traffic. Monitoring active with alerts configured. Infrastructure recovery complete."

You: "Generate a full recovery report and email it to the team."

Luminous Nix: "Recovery report generated and emailed to team. Summary: 10 servers rebuilt in 43 minutes. All services operational. Zero data loss thanks to off-site backups. Estimated RTO: 45 minutes against target of 4 hours."
```

**Advanced features demonstrated:**

1. **Completely hands-free operation** - Voice only, no typing
2. **Context awareness** - Remembers previous configuration ("standard monitoring stack")
3. **Intelligent suggestions** - Proposes reasonable defaults
4. **Multi-server orchestration** - Manages 10 servers in parallel
5. **Progress reporting** - Continuous status updates
6. **Automatic report generation** - Documentation created automatically

**Business impact:**
- **RTO:** 45 minutes (actual) vs 4 hours (target) = 81% improvement
- **Minimal downtime:** Holding page up in 15 minutes
- **CTO productivity:** Rebuilt infrastructure while handling insurance, communications, team coordination
- **Stress reduction:** Natural conversation vs remembering exact commands under pressure

---

## Terra Lumina Advanced Strategies

### Use Case 4: Sophisticated Portfolio Optimization for Retirement

**Scenario:** 58-year-old investor with $800K portfolio wants to optimize for:
- Retirement income (10% annual distributions)
- Low volatility (stable returns)
- Environmental impact
- Community benefit
- Tax efficiency

**Current portfolio:**
- 50% stocks ($400K)
- 30% bonds ($240K)
- 20% REITs ($160K)

**Goal:** Integrate Terra Lumina for better risk-adjusted returns with impact.

**Solution: Advanced portfolio optimization**

**Step 1: Analysis**

```
Current portfolio metrics:
- Expected return: 7.5% annually
- Volatility (std dev): 12%
- Sharpe ratio: 0.46
- Distributions: 3.5% yield
- Impact: Low (indirect via ESG screens in some holdings)

Desired improvements:
- Higher distributions (10%)
- Lower volatility (<8%)
- Better risk-adjusted returns (Sharpe > 0.8)
- Direct, measurable impact
- Tax-efficient distributions in retirement
```

**Step 2: Terra Lumina allocation strategy**

Replace high-volatility, low-yield portions with Terra Lumina:

**New portfolio:**
- 35% stocks ($280K) - Reduce by $120K
- 15% bonds ($120K) - Reduce by $120K
- 10% REITs ($80K) - Reduce by $80K
- **40% Terra Lumina ($320K)** - New allocation

**Terra Lumina $320K diversification:**

```
Geographic (country diversification):
- 30% United States (96K) - Domestic preference
- 25% Europe (80K) - Developed markets
- 20% Latin America (64K) - Higher growth
- 15% Africa (48K) - Emerging markets
- 10% Asia-Pacific (32K) - Geographic diversity

Technology (risk/return balance):
- 40% Solar (128K) - Low risk, proven
- 30% Wind (96K) - Medium risk, reliable
- 20% Hydro (64K) - Very low risk, stable
- 10% Storage (32K) - Higher risk, growth potential

Project Stage (income timing):
- 60% Operating (192K) - Immediate distributions
- 30% Construction (96K) - Distributions start in 1-2 years
- 10% Planning (32K) - Higher risk/return, distributions start in 3-4 years

Examples of actual allocation:
1. $48K - Sunrise Solar (Nevada) - Operating, 10.5% return
2. $32K - Wind Highlands (Scotland) - Operating, 11.2% return
3. $24K - Sol Andino (Peru) - Operating, 12.8% return
4. $40K - Atlantic Offshore Wind (Ireland) - Construction, 9.8% projected
5. $28K - Kenya Solar Cooperative - Operating, 13.5% return
6. ... (continue for 15-20 total projects)
```

**Step 3: Projected outcomes**

**Annual distributions:**

| Source | Annual Yield | Amount |
|--------|--------------|--------|
| Stocks (dividends) | 2% | $5,600 |
| Bonds (interest) | 4% | $4,800 |
| REITs (distributions) | 5% | $4,000 |
| Terra Lumina | 10.5% avg | $33,600 |
| **Total** | **6.0%** | **$48,000** |

**vs. Previous:**
- Old: 3.5% ($28,000)
- New: 6.0% ($48,000)
- **Increase: $20,000/year (71% more income)**

**Volatility reduction:**

| Metric | Old Portfolio | New Portfolio | Change |
|--------|--------------|---------------|--------|
| Volatility (std dev) | 12% | 7.2% | -40% |
| Sharpe ratio | 0.46 | 0.92 | +100% |
| Max drawdown (expected) | -35% | -15% | -57% |

**Why volatility drops:**
- Terra Lumina not traded (no market volatility)
- Uncorrelated to stock market
- Contracted revenue (predictable)
- Physical assets (stable value)

**Tax efficiency:**

```
Qualified dividends (stocks): 0-20% tax
Bond interest: Ordinary income (10-37%)
REIT distributions: Ordinary income (10-37%)
Terra Lumina distributions: Ordinary income (10-37%)

BUT in retirement (lower tax bracket):
- Working years: 32% marginal rate
- Retirement: 12% marginal rate

Tax on $48K distributions at 12% = $5,760/year
vs. $28K at 32% = $8,960/year

LOWER total tax despite higher income.
```

**Impact measurement:**

Terra Lumina $320K over 10 years supports:
- 75 MW renewable energy capacity
- 180,000 MWh annual generation
- 120,000 tons CO₂ avoided annually
- 1,200 permanent local jobs
- 6 communities receive ownership

**Quantified impact:**
- Carbon offset equivalent: 25 cars removed from roads permanently
- Energy equivalent: Power for 18,000 homes
- Local economic impact: $4.8M annually to communities (after investor exit)

**Step 4: Implementation timeline**

```
Month 1-3: Gradual shift
- Sell $120K low-yield bonds
- Invest $120K in operating Terra Lumina projects
- Begin receiving distributions immediately

Month 4-6: Continued transition
- Sell $120K high-volatility stocks
- Invest $120K in Terra Lumina mix (operating + construction)
- Diversify across geographies and technologies

Month 7-9: Final allocation
- Sell $80K REITs
- Complete $320K Terra Lumina allocation
- Full diversification across 15-20 projects

Month 10-12: Optimization
- Monitor distributions
- Rebalance as needed
- Claim quarterly distributions
```

**Advanced features demonstrated:**

1. **Multi-dimensional diversification** - Geography, technology, stage
2. **Income optimization** - 71% higher distributions
3. **Risk reduction** - 40% lower volatility
4. **Tax efficiency** - Lower taxes despite higher income
5. **Impact measurement** - Quantified environmental and community benefit
6. **Strategic timing** - Gradual transition over 9 months

**Results after 10 years:**

```
Capital returned: $800K (original investment)
Distributions received: $480K (10 years × $48K)
Total value to investor: $1.28M

Community value (post-transfer):
- Assets transferred: $320K original → $480K current value
- Ongoing annual benefit: $48K/year × 15 years remaining = $720K
- Total community benefit: $1.2M+

Combined value created: $2.5M from $800K investment
```

---

### Use Case 5: Impact-Focused Family Foundation Portfolio

**Scenario:** Family foundation with $5M endowment wants to maximize renewable energy impact while generating 5% annual distributions for grants.

**Requirements:**
- Generate $250K/year for grant-making
- Maximize tons of CO₂ avoided
- Geographic diversity (support global south)
- Preference for community ownership model
- Long-term (10+ year) investment horizon
- Measurable, reportable impact

**Solution: Strategic impact-maximizing portfolio**

**Portfolio strategy:**

```
Total allocation: $5,000,000

Geographic allocation (60% Global South focus):
- Africa: $1.5M (30%) - Highest impact per dollar
- Latin America: $1.0M (20%) - Strong community models
- Southeast Asia: $500K (10%) - Emerging opportunities
- Europe: $1.0M (20%) - Proven technology, lower risk
- North America: $1.0M (20%) - Stable, diversified

Technology allocation (maximize impact):
- Solar: $2.0M (40%) - Best $/kWh in sunny regions
- Wind: $1.5M (30%) - Excellent in coastal areas
- Hydro: $1.0M (20%) - Baseload power for remote areas
- Storage: $500K (10%) - Enable higher renewable penetration

Stage allocation (balance impact timing):
- Operating: $2.5M (50%) - Immediate distributions + impact
- Construction: $1.5M (30%) - Near-term impact (1-2 years)
- Planning: $1.0M (20%) - Highest impact potential (3-5 years)

Impact priority allocation:
- Electrification (first-time access): $2.0M (40%)
- Fossil fuel displacement: $1.5M (30%)
- Grid stability/storage: $500K (10%)
- Economic development: $1.0M (20%)
```

**Example project selection:**

**Tier 1: Maximum Impact Projects ($2.0M electrification)**

1. **Solwezi Solar Cooperative (Zambia) - $300K**
   - First-time electricity access for 2,000 people
   - 500 kW solar + storage
   - Powers school, clinic, water pumps
   - Creates 45 local jobs
   - Community ownership year 10
   - Expected return: 13.5%
   - **Impact: 1,200 tons CO₂/year, life-changing access**

2. **Amazon Micro-Hydro Network (Peru) - $500K**
   - 15 micro-hydro installations (2-5 kW each)
   - Serves 8 remote villages (1,500 people total)
   - Replaces diesel generators
   - Local operation and maintenance
   - **Impact: 800 tons CO₂/year + health (no diesel fumes)**

3. **Madagascar Solar Clinics - $400K**
   - Solar power for 12 rural health clinics
   - Reliable power for refrigeration (vaccines), lighting, equipment
   - Serves 50,000 people catchment area
   - **Impact: 450 tons CO₂/year + healthcare access**

[... Continue for all $2.0M]

**Tier 2: Fossil Displacement Projects ($1.5M)**

4. **Coal-to-Solar Transition (South Africa) - $600K**
   - Replace coal plant with 10 MW solar
   - Powers 3,000 homes previously on coal
   - Just transition program for coal workers
   - **Impact: 18,000 tons CO₂/year**

[... Continue ...]

**Projected portfolio outcomes:**

**Financial:**
```
Annual distributions: $250K (5.0% average)
- Operating projects: $150K immediate
- Construction projects: +$50K in year 2
- Planning projects: +$50K in years 3-5

10-year total distributions: $2.5M
Return of capital (year 10): $5.0M
Total financial return: $7.5M (50% total return)
```

**Impact (annual):**
```
Energy generation: 35,000 MWh/year
CO₂ avoided: 28,000 tons/year
10-year total CO₂ avoided: 280,000 tons

Equivalent to:
- 60,000 cars removed from roads for 1 year
- 350,000 acres of forest preserved
- 65 million pounds of coal not burned

People impacted:
- First-time electricity access: 15,000 people
- Improved reliability: 45,000 people
- Economic opportunity (jobs): 800 permanent jobs
- Community ownership: 25 communities
```

**Reporting dashboard:**

```
┌─────────────────────────────────────────────────┐
│  Foundation Impact Dashboard - YTD 2025         │
├─────────────────────────────────────────────────┤
│                                                 │
│  Financial Performance:                         │
│  ├─ Distributions received: $250,000 (5.0%)    │
│  ├─ Grants made: $250,000 (100% deployed)      │
│  └─ Portfolio value: $5,000,000 (stable)       │
│                                                 │
│  Impact Performance:                            │
│  ├─ CO₂ avoided: 28,000 tons                   │
│  ├─ Energy generated: 35,000 MWh               │
│  ├─ People served: 60,000                      │
│  ├─ Jobs created: 800                           │
│  └─ Communities benefiting: 25                  │
│                                                 │
│  Top 5 Impact Projects:                         │
│  1. South Africa Coal Transition: 18K tons CO₂ │
│  2. Solwezi Solar: 2K people first-time access │
│  3. Brazil Wind Farm: 12K tons CO₂             │
│  4. Indonesia Hydro: 1.5K people, 450 jobs     │
│  5. Kenya Solar Network: 8K tons CO₂           │
│                                                 │
│  Upcoming (next 12 months):                     │
│  ├─ 3 projects transitioning to operations      │
│  ├─ +$50K distributions expected                │
│  ├─ +12,000 tons CO₂ avoided (new capacity)    │
│  └─ 2 community ownership transitions beginning │
└─────────────────────────────────────────────────┘
```

**Annual impact report:**

Foundation generates comprehensive annual report with:

1. **Financial summary** - Distributions, grant-making, portfolio value
2. **Impact metrics** - CO₂, energy, people, jobs (with photos and stories)
3. **Project spotlights** - Deep dives on 5-10 highest-impact projects
4. **Community stories** - First-person accounts from beneficiaries
5. **Geographic breakdown** - Map showing global portfolio
6. **Technology analysis** - Performance by technology type
7. **Looking ahead** - Pipeline projects, expected impact growth

**Advanced features demonstrated:**

1. **Impact-optimized allocation** - Maximize CO₂ and people served per dollar
2. **Multi-tier strategy** - Electrification, displacement, development
3. **Comprehensive reporting** - Financial + impact integrated
4. **Long-term vision** - 10+ year commitment to community ownership
5. **Storytelling** - Quantitative metrics + qualitative narratives
6. **Grant integration** - Distributions fund additional impact (grants)

**Foundation board perspective:**

> "We used to invest our endowment in traditional ESG funds and make separate grants for climate work. Now our endowment IS our climate work. We generate 5% for additional grants while the invested capital directly builds renewable energy that will benefit communities for decades. Our dollars work twice."

---

## Integration Examples

### Integration Example 1: CI/CD Pipeline with Luminous Nix

**Scenario:** Automate deployment pipeline using Luminous Nix for server configuration.

**GitHub Actions workflow:**

```yaml
# .github/workflows/deploy.yml
name: Deploy Application

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: self-hosted  # Runner has Luminous Nix installed

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Configure server with Luminous Nix
        run: |
          ask-nix "ensure nodejs 20, nginx, and pm2 are installed" -y
          ask-nix "restart nginx if configuration changed" -y

      - name: Deploy application
        run: |
          npm install
          npm run build
          pm2 reload app-production

      - name: Verify deployment
        run: |
          ask-nix "is nginx serving traffic?" -y
          curl -f https://app.example.com/health || exit 1

      - name: Notify team
        if: success()
        run: |
          ask-nix "log successful deployment to /var/log/deployments.log" -y
```

**Benefits:**
- Natural language server configuration
- Self-documenting (readable workflow)
- Automatic rollback if deployment fails (Luminous Nix feature)
- Easy to understand for non-DevOps team members

---

### Integration Example 2: Terra Lumina API - Portfolio Management Bot

**Scenario:** Automated portfolio rebalancing and distribution claiming using Terra Lumina API.

**Python script:**

```python
#!/usr/bin/env python3
"""
Portfolio management bot for Terra Lumina.

Automatically:
- Rebalances portfolio to target allocation
- Claims distributions when available
- Sends monthly performance reports
"""

import requests
from datetime import datetime

# Terra Lumina API setup
API_BASE = "https://api.terralumina.org/v1"
API_KEY = "your-api-key-here"

headers = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

def get_portfolio():
    """Fetch current portfolio."""
    response = requests.get(f"{API_BASE}/portfolio", headers=headers)
    return response.json()

def get_available_distributions():
    """Check for claimable distributions."""
    response = requests.get(f"{API_BASE}/distributions/available", headers=headers)
    return response.json()

def claim_distribution(distribution_id):
    """Claim a distribution."""
    response = requests.post(
        f"{API_BASE}/distributions/{distribution_id}/claim",
        headers=headers
    )
    return response.json()

def get_portfolio_allocation():
    """Calculate current portfolio allocation."""
    portfolio = get_portfolio()
    total_value = sum(p["current_value"] for p in portfolio["projects"])

    allocation = {
        "geography": {},
        "technology": {},
        "stage": {}
    }

    for project in portfolio["projects"]:
        # Geography
        country = project["country"]
        allocation["geography"][country] = \
            allocation["geography"].get(country, 0) + project["current_value"]

        # Technology
        tech = project["technology"]
        allocation["technology"][tech] = \
            allocation["technology"].get(tech, 0) + project["current_value"]

        # Stage
        stage = project["stage"]
        allocation["stage"][stage] = \
            allocation["stage"].get(stage, 0) + project["current_value"]

    # Convert to percentages
    for category in allocation:
        for key in allocation[category]:
            allocation[category][key] = \
                (allocation[category][key] / total_value) * 100

    return allocation

def rebalance_portfolio(target_allocation):
    """
    Rebalance portfolio to target allocation.

    Target allocation example:
    {
        "technology": {"solar": 40, "wind": 30, "hydro": 20, "storage": 10},
        "geography": {"us": 30, "europe": 25, "latam": 25, "africa": 20},
        "stage": {"operating": 50, "construction": 30, "planning": 20}
    }
    """
    current = get_portfolio_allocation()
    recommendations = []

    for category in target_allocation:
        for key, target_pct in target_allocation[category].items():
            current_pct = current[category].get(key, 0)
            diff = target_pct - current_pct

            if abs(diff) > 5:  # Rebalance if >5% off target
                action = "increase" if diff > 0 else "decrease"
                recommendations.append({
                    "category": category,
                    "subcategory": key,
                    "action": action,
                    "amount_pct": abs(diff)
                })

    return recommendations

def send_monthly_report():
    """Generate and send monthly portfolio report."""
    portfolio = get_portfolio()
    distributions = get_available_distributions()

    report = f"""
    Terra Lumina Monthly Report - {datetime.now().strftime('%B %Y')}

    Portfolio Summary:
    - Total invested: ${portfolio['total_invested']:,.2f}
    - Current value: ${portfolio['current_value']:,.2f}
    - Total distributions: ${portfolio['total_distributions']:,.2f}

    This Month:
    - Distributions received: ${portfolio['monthly_distributions']:,.2f}
    - Available to claim: ${sum(d['amount'] for d in distributions):,.2f}
    - Projects updated: {len(portfolio['recent_updates'])}

    Impact This Month:
    - Energy generated: {portfolio['impact']['energy_mwh']:,.0f} MWh
    - CO₂ avoided: {portfolio['impact']['co2_tons']:,.0f} tons

    Top Performing Projects:
    {format_top_projects(portfolio['projects'])}

    Action Items:
    - {len(distributions)} distributions available to claim
    - {len(rebalance_portfolio(TARGET_ALLOCATION))} rebalancing recommendations
    """

    # Send email (using your preferred email service)
    send_email(to="investor@example.com", subject="Terra Lumina Monthly Report", body=report)

# Target allocation (customize)
TARGET_ALLOCATION = {
    "technology": {"solar": 40, "wind": 30, "hydro": 20, "storage": 10},
    "geography": {"us": 30, "europe": 25, "latam": 25, "africa": 20},
    "stage": {"operating": 50, "construction": 30, "planning": 20}
}

# Main execution
if __name__ == "__main__":
    # 1. Claim any available distributions
    distributions = get_available_distributions()
    for dist in distributions:
        result = claim_distribution(dist["id"])
        print(f"Claimed ${dist['amount']:.2f} from {dist['project_name']}")

    # 2. Check portfolio allocation
    current_allocation = get_portfolio_allocation()
    print(f"Current allocation: {current_allocation}")

    # 3. Get rebalancing recommendations
    recommendations = rebalance_portfolio(TARGET_ALLOCATION)
    if recommendations:
        print(f"Rebalancing needed: {len(recommendations)} adjustments")
        for rec in recommendations:
            print(f"  - {rec['action'].title()} {rec['subcategory']} by {rec['amount_pct']:.1f}%")

    # 4. Send monthly report (if it's the 1st of month)
    if datetime.now().day == 1:
        send_monthly_report()
```

**Benefits:**
- Automated portfolio management
- Consistent rebalancing
- Never miss distribution claims
- Regular performance tracking
- Scales to any portfolio size

---

## Next Steps

**Ready to implement advanced use cases?**

1. **Start simple:** Try basic workflows first
2. **Iterate:** Add complexity gradually
3. **Automate:** Create scripts for repeated tasks
4. **Share:** Contribute your use cases to community
5. **Learn:** Join Discord to discuss advanced topics

**Need help?**

- Discord: [#advanced-use-cases](https://discord.gg/luminous)
- Email: support@luminousdynamics.org
- Documentation: [API References](luminous-nix/api.md)

---

*Advanced use cases are limited only by imagination. Build something amazing.* 🚀

[Back to Home](index.md) | [Tutorials](tutorials.md) | [API References](luminous-nix/api.md)
