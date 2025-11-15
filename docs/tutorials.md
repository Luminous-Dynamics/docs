# Tutorials

Hands-on, step-by-step guides for real-world tasks with Luminous Nix and Terra Lumina.

## Overview

These tutorials walk you through actual workflows you'll encounter. Each tutorial includes:

- ✅ **Prerequisites** - What you need before starting
- 📋 **Step-by-step instructions** - Copy-paste ready commands
- 🎯 **Expected outcomes** - What success looks like
- 🔧 **Troubleshooting** - Common issues and fixes
- 🚀 **Next steps** - Where to go from here

**Difficulty levels:**
- 🟢 **Beginner** - New to Luminous Dynamics
- 🟡 **Intermediate** - Comfortable with basics
- 🔴 **Advanced** - Power user ready

---

## Luminous Nix Tutorials

### Tutorial 1: Set Up a Complete Web Development Environment 🟢

**Goal:** Create a full-stack web development environment with Node.js, PostgreSQL, and VS Code.

**Time:** 20 minutes

**Prerequisites:**
- Luminous Nix installed
- Basic familiarity with web development

#### Step 1: Install Core Development Tools

```bash
ask-nix "install nodejs, npm, and yarn for JavaScript development"
```

**Expected output:**
```
I'll install Node.js, npm, and yarn. Should I proceed?
> Yes

Installing nodejs-20.10.0...
Installing npm-10.2.5...
Installing yarn-1.22.19...
✓ All packages installed successfully
```

**Verify installation:**
```bash
node --version  # Should show v20.10.0
npm --version   # Should show 10.2.5
yarn --version  # Should show 1.22.19
```

#### Step 2: Set Up Database

```bash
ask-nix "install PostgreSQL and enable it as a service"
```

**Luminous Nix will:**
1. Install PostgreSQL 15
2. Initialize the database
3. Enable and start the service
4. Set up initial user

**Verify database:**
```bash
psql --version  # Should show PostgreSQL 15.x
ask-nix "is postgresql running?"  # Should confirm it's running
```

#### Step 3: Install Code Editor and Extensions

```bash
ask-nix "install VS Code"
```

**Then install extensions via command line:**
```bash
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension bradlc.vscode-tailwindcss
```

#### Step 4: Create a Sample Project

```bash
# Create project directory
mkdir my-web-app && cd my-web-app

# Initialize project
npm init -y

# Install dependencies
ask-nix "I need Express and React for a web app"
```

**Luminous Nix will understand and suggest:**
```
I recommend:
- express (backend framework)
- react, react-dom (frontend)
- Would you like me to add them to package.json?
```

#### Step 5: Set Up Database Connection

```bash
# Create database
psql -U postgres -c "CREATE DATABASE my_web_app;"

# Install database client
npm install pg

# Create a simple connection test
cat > db-test.js << 'EOF'
const { Client } = require('pg');
const client = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'my_web_app',
  port: 5432,
});

client.connect()
  .then(() => console.log('✓ Database connected'))
  .catch(err => console.error('✗ Connection error', err))
  .finally(() => client.end());
EOF

# Test connection
node db-test.js
```

**Expected output:**
```
✓ Database connected
```

#### Step 6: Create Development Scripts

Add to your `package.json`:
```json
{
  "scripts": {
    "dev": "node server.js",
    "db:migrate": "node migrations/run.js",
    "lint": "eslint .",
    "format": "prettier --write ."
  }
}
```

#### Verification Checklist

- [ ] Node.js, npm, yarn installed and working
- [ ] PostgreSQL running and accessible
- [ ] VS Code installed with extensions
- [ ] Sample project created
- [ ] Database connection successful
- [ ] Development scripts configured

#### Troubleshooting

**Problem:** PostgreSQL won't start

```bash
# Check status
ask-nix "show me postgresql logs"

# Restart service
ask-nix "restart postgresql service"
```

**Problem:** Node command not found

```bash
# Reload shell profile
source ~/.nix-profile/etc/profile.d/nix.sh

# Or restart terminal
```

#### Next Steps

- 📚 Learn about [NixOS dev environments](luminous-nix/advanced.md#development-environments)
- 🔧 Explore [configuration management](luminous-nix/user-guide.md#configuration)
- 🚀 Read about [deployment](luminous-nix/advanced.md#remote-management)

---

### Tutorial 2: Deploy a Self-Hosted Server 🟡

**Goal:** Set up a complete self-hosted server with web server, SSL, and monitoring.

**Time:** 45 minutes

**Prerequisites:**
- NixOS system or VPS
- Domain name pointing to your server
- Root/sudo access

#### Step 1: Initial Server Setup

```bash
# Update system
ask-nix "update the system and install security updates"

# Set up firewall
ask-nix "enable firewall and allow only SSH, HTTP, and HTTPS"
```

**Expected result:**
```
Firewall configured with rules:
- Port 22 (SSH): ALLOW
- Port 80 (HTTP): ALLOW
- Port 443 (HTTPS): ALLOW
- All other ports: DENY
```

#### Step 2: Install and Configure Web Server

```bash
# Install nginx
ask-nix "install nginx and configure it as a web server"

# Create a simple test page
sudo mkdir -p /var/www/html
echo "<h1>Server is running!</h1>" | sudo tee /var/www/html/index.html

# Test nginx configuration
sudo nginx -t
```

#### Step 3: Set Up SSL with Let's Encrypt

```bash
# Install certbot
ask-nix "install certbot for SSL certificates"

# Get certificate (replace with your domain)
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

**Follow the prompts:**
- Enter email for urgent renewal notices
- Agree to terms of service
- Choose whether to redirect HTTP to HTTPS (recommended: yes)

#### Step 4: Configure Automatic Renewal

```bash
# Set up automatic certificate renewal
ask-nix "configure certbot to automatically renew SSL certificates"

# Test renewal process
sudo certbot renew --dry-run
```

**Expected output:**
```
Congratulations, all simulated renewals succeeded
```

#### Step 5: Install Monitoring

```bash
# Install monitoring tools
ask-nix "install htop for system monitoring and nginx for web stats"

# Set up log monitoring
ask-nix "show me nginx access logs"
```

#### Step 6: Deploy a Sample Application

```bash
# Create application directory
sudo mkdir -p /var/www/app
cd /var/www/app

# Clone or create your app
# For this example, a simple Node.js app:
cat > server.js << 'EOF'
const http = require('http');
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('<h1>My App is Running!</h1>');
});
server.listen(3000);
console.log('Server running on port 3000');
EOF

# Install process manager
ask-nix "install pm2 to manage Node.js applications"

# Start application
pm2 start server.js --name my-app
pm2 save
pm2 startup  # Follow the instructions
```

#### Step 7: Configure Nginx Reverse Proxy

Create nginx configuration:

```bash
sudo cat > /etc/nginx/sites-available/my-app << 'EOF'
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Enable site
sudo ln -s /etc/nginx/sites-available/my-app /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

#### Step 8: Set Up Backups

```bash
# Create backup script
ask-nix "help me set up daily backups of /var/www"

# Luminous Nix will guide you through:
# - Choosing backup location
# - Setting schedule
# - Configuring retention
# - Testing backup/restore
```

#### Verification Checklist

- [ ] Server accessible via HTTPS
- [ ] SSL certificate valid and auto-renewing
- [ ] Application running and accessible
- [ ] Firewall configured correctly
- [ ] Monitoring tools installed
- [ ] Backups configured and tested
- [ ] Process manager keeping app alive

#### Troubleshooting

**Problem:** SSL certificate fails

```bash
# Check DNS propagation
dig yourdomain.com

# Verify nginx config
sudo nginx -t

# Check certbot logs
sudo tail -f /var/log/letsencrypt/letsencrypt.log
```

**Problem:** Application not accessible

```bash
# Check if app is running
pm2 list

# Check nginx is proxying correctly
sudo nginx -t
curl -I http://localhost:3000

# Check firewall
sudo iptables -L -n
```

#### Next Steps

- 📈 Set up [advanced monitoring](luminous-nix/advanced.md#monitoring)
- 🔒 Implement [security hardening](luminous-nix/advanced.md#security)
- 🚀 Learn about [scaling](luminous-nix/advanced.md#performance)

---

### Tutorial 3: Voice-Controlled System Management 🟡

**Goal:** Set up and use voice control for hands-free system administration.

**Time:** 30 minutes

**Prerequisites:**
- Luminous Nix installed
- Working microphone
- Speakers or headphones

#### Step 1: Hardware Test

```bash
# Test microphone
luminous-nix voice --test-mic

# Speak clearly for 5 seconds
# You should see your speech transcribed
```

**Expected output:**
```
🎤 Microphone test starting...
Speak now for 5 seconds...

Heard: "This is a test of the microphone"
✓ Microphone working correctly
```

#### Step 2: Configure Voice Settings

```bash
# Edit voice configuration
luminous-nix config edit
```

Add or modify:
```yaml
voice:
  enabled: true
  wake_word: "hey nix"
  tts_enabled: true
  tts_voice: "en_US-lessac-medium"
  energy_threshold: 300
  confirmations:
    read_aloud: true
    wait_for_verbal: true
```

#### Step 3: Start Voice Mode

```bash
luminous-nix voice --continuous --wake-word "hey nix"
```

**You'll see:**
```
🎤 Voice interface started
📢 Wake word: "hey nix"
Listening...
```

#### Step 4: Try Basic Commands

**Say:** "Hey Nix, what packages are installed?"

**Luminous Nix responds:**
```
I'll show you installed packages.
[Lists packages]
```

**Say:** "Hey Nix, install htop"

**Luminous Nix responds:**
```
I'll install htop. Should I proceed?
```

**Say:** "Yes"

**Luminous Nix responds:**
```
Installing htop...
Installation complete. Htop is ready to use.
```

#### Step 5: Advanced Voice Commands

**Multi-step commands:**

**Say:** "Hey Nix, install docker, enable the service, and add me to the docker group"

**Conditional commands:**

**Say:** "Hey Nix, if disk space is low, clean up old package builds"

**Information queries:**

**Say:** "Hey Nix, what's my IP address and how much memory am I using?"

#### Step 6: Customize for Your Workflow

Create voice shortcuts in config:

```yaml
voice:
  shortcuts:
    "morning setup": |
      ask-nix "start postgresql, redis, and docker services"
    "evening cleanup": |
      ask-nix "stop all development services and run cleanup"
    "deploy app": |
      ask-nix "pull latest code, rebuild, and restart services"
```

**Usage:**

**Say:** "Hey Nix, run morning setup"

All three services start automatically!

#### Step 7: Accessibility Features

For users with visual impairments:

```yaml
voice:
  accessibility:
    verbose_output: true
    speak_all_confirmations: true
    audio_feedback: true
    error_sounds: true
```

#### Tips for Better Recognition

**Do:**
- ✅ Speak clearly and at normal pace
- ✅ Use natural language
- ✅ Pause briefly after wake word
- ✅ Minimize background noise

**Avoid:**
- ❌ Whispering or shouting
- ❌ Speaking too fast
- ❌ Music or TV in background
- ❌ Overly complex sentences

#### Troubleshooting

**Problem:** Wake word not detected

```bash
# Adjust sensitivity
luminous-nix config set voice.energy_threshold 200

# Restart voice mode
```

**Problem:** Poor transcription accuracy

```bash
# Use larger Whisper model
luminous-nix config set voice.whisper_model medium

# Trade-off: More accurate but slower
```

#### Verification Checklist

- [ ] Microphone detected and working
- [ ] Wake word triggers successfully
- [ ] Commands understood correctly
- [ ] Voice responses audible
- [ ] Multi-step commands work
- [ ] Custom shortcuts configured

#### Next Steps

- 🎤 Explore [advanced voice features](luminous-nix/voice.md)
- ♿ Learn about [accessibility options](luminous-nix/voice.md#accessibility)
- 🔧 Customize [voice shortcuts](luminous-nix/advanced.md#automation)

---

## Terra Lumina Tutorials

### Tutorial 4: Build Your First Renewable Energy Portfolio 🟢

**Goal:** Create a diversified $500 renewable energy investment portfolio from scratch.

**Time:** 45 minutes (including account setup)

**Prerequisites:**
- $500 to invest (or adjust amounts proportionally)
- Government-issued ID
- Bank account or payment method

#### Step 1: Create Account and Complete KYC

**Visit:** [terralumina.org/signup](https://terralumina.org/signup)

1. **Sign up:**
   - Email: your-email@example.com
   - Password: (strong password)
   - Country: United States

2. **Verify email:**
   - Check inbox for verification link
   - Click to verify

3. **Complete KYC:**
   - Upload government ID (both sides)
   - Take selfie (follow on-screen instructions)
   - Provide basic information

**Wait time:** 5-15 minutes for verification

**You'll receive:** Email confirming KYC approval

#### Step 2: Understand Your Investment Goals

Before investing, define your goals:

**Example profile:**
- **Amount:** $500
- **Timeline:** 10 years
- **Risk tolerance:** Moderate
- **Priority:** Balanced returns + impact
- **Preference:** Support US projects primarily

#### Step 3: Research and Select Projects

**Use the Five Pillar Framework:**

**Project 1: Operating Solar (40% = $200)**

**Search:** Solar + Operating + USA

**Find:** "California Community Solar - 5MW"

**Evaluate:**
- ✅ Financial: 9% annual, 3rd party audited
- ✅ Technical: Proven panels, 2 years operating
- ✅ Community: Powers 500 homes, local ownership plan
- ✅ Risk: Low (operating, insurance)
- ✅ Values: Transparent, community-first

**Decision:** Invest $200

**Project 2: Wind Under Construction (30% = $150)**

**Search:** Wind + Construction + USA

**Find:** "Texas Wind Farm Expansion - 25MW"

**Evaluate:**
- ✅ Financial: 11% annual, construction 60% complete
- ✅ Technical: Reputable turbines, proven technology
- ✅ Community: 45 jobs created, rural development
- ✅ Risk: Medium (construction risk, mitigated)
- ✅ Values: Community ownership in 2035

**Decision:** Invest $150

**Project 3: Small Hydro (20% = $100)**

**Search:** Hydro + Any stage + USA

**Find:** "Oregon Run-of-River Hydro - 2MW"

**Evaluate:**
- ✅ Financial: 8% annual, stable returns
- ✅ Technical: Run-of-river, minimal environmental impact
- ✅ Community: Remote area power access
- ✅ Risk: Low (operating 18 months)
- ✅ Values: Salmon-safe design, indigenous consultation

**Decision:** Invest $100

**Project 4: Emerging Technology (10% = $50)**

**Search:** Storage OR Nuclear

**Find:** "Community Battery Storage - 5MWh - Colorado"

**Evaluate:**
- ✅ Financial: 13% annual, higher risk/reward
- ✅ Technical: Lithium iron phosphate, proven chemistry
- ✅ Community: Grid resilience, peak shaving
- ✅ Risk: Medium-high (new installation)
- ✅ Values: Enables more solar/wind

**Decision:** Invest $50

#### Step 4: Execute Investments

For each project:

1. **Click "Invest"** on project page
2. **Enter amount:** $200, $150, $100, $50
3. **Choose payment:** Credit card / Bank transfer
4. **Review details:**
   - Project name
   - Investment amount
   - Expected returns
   - Exit timeline
5. **Confirm investment**
6. **Save confirmation email**

**Total invested:** $500 across 4 projects

#### Step 5: Set Up Portfolio Tracking

**Enable notifications:**
- ☑ Quarterly distribution notifications
- ☑ Project update emails
- ☑ Monthly portfolio summary

**Set up dashboard:**
- Add all 4 projects to watchlist
- Enable portfolio performance chart
- Configure distribution auto-claim

#### Step 6: Plan Distribution Strategy

**Your 4 projects will distribute:**

| Project | Quarterly Distribution (est.) |
|---------|------------------------------|
| CA Solar ($200) | ~$4.50/quarter |
| TX Wind ($150) | ~$4.13/quarter |
| OR Hydro ($100) | ~$2.00/quarter |
| CO Storage ($50) | ~$1.63/quarter |
| **Total** | **~$12.26/quarter** |

**Strategy options:**

**Option A: Reinvest**
- Claim distributions
- Reinvest in same or new projects
- Compound growth

**Option B: Take income**
- Claim and withdraw
- Use for expenses
- Steady cash flow

**Option C: Hybrid**
- Reinvest half
- Withdraw half
- Balanced approach

#### Step 7: Monitor and Rebalance

**Quarterly review (15 minutes):**

1. **Check performance:**
   - Actual vs expected returns
   - Project updates
   - Any issues

2. **Claim distributions:**
   - Review available distributions
   - Claim all (or select)
   - Choose payment method

3. **Rebalance if needed:**
   - If one sector grows >50%
   - Add new projects
   - Maintain diversification

**Annual review (30 minutes):**

1. **Calculate returns:**
   - Total invested: $500
   - Distributions received: ~$49/year
   - Return: ~9.8%

2. **Adjust strategy:**
   - Add more capital?
   - Change allocation?
   - New opportunities?

3. **Tax planning:**
   - Download tax documents
   - Calculate gains
   - Plan for next year

#### Verification Checklist

- [ ] Account created and KYC approved
- [ ] Portfolio goals defined
- [ ] 4 projects researched and evaluated
- [ ] $500 invested across 4 projects
- [ ] Notifications configured
- [ ] Distribution strategy chosen
- [ ] First quarterly review scheduled

#### Troubleshooting

**Problem:** Can't find suitable projects

```
Solution:
- Broaden search criteria
- Consider different technologies
- Look at different regions
- Check "recently funded" for ideas
```

**Problem:** Investment minimum too high

```
Solution:
- Start with smaller projects ($10 min)
- Invest in same project multiple times
- Save up to reach minimums
- Focus on community solar (often $10 min)
```

#### Next Steps

- 📊 Learn [advanced portfolio strategies](terra-lumina/investment-guide.md)
- 🔍 Master [project evaluation](terra-lumina/projects.md#evaluation-framework)
- 💰 Explore [tax optimization](terra-lumina/investment-guide.md#tax-optimization)

---

### Tutorial 5: Evaluate a Project Like a Pro 🟡

**Goal:** Perform comprehensive due diligence on a renewable energy project.

**Time:** 90 minutes

**Prerequisites:**
- Terra Lumina account
- Basic understanding of renewable energy
- Spreadsheet software (for analysis)

#### Step 1: Initial Screening

**Project:** "Sunrise Solar Farm - Nevada" (example)

**Quick checks:**
- ✅ Rating: 4.8/5 ⭐ (good)
- ✅ Funding: 72% (strong momentum)
- ✅ Investors: 614 (diversified)
- ✅ Documents: Complete set available
- ✅ Third-party validation: Yes (DNV GL)

**Decision:** Proceed with full evaluation

#### Step 2: Financial Analysis

**Download financial documents:**
- Pro forma cash flow projections
- Third-party valuation report
- Power Purchase Agreement (redacted)

**Key metrics to verify:**

**Revenue assumptions:**
```
Energy generation: 120,000 MWh/year
PPA price: $70/MWh
Revenue: $8,400,000/year

✓ Check: Is this realistic?
- Compare to similar projects
- Check local PPA rates
- Verify with third-party report
```

**Operating costs:**
```
O&M: $1,800,000/year ($36/kW/year)

✓ Check: Industry standard?
- Typical range: $25-50/kW/year
- This falls within range ✓
```

**Returns calculation:**
```
Your investment: $1,000
Project ownership: 3.85%
Your share of revenue: ~$105/year
Expected return: 10.5%

✓ Check math:
$1,000 × 10.5% = $105 ✓
```

**Create your own projection:**

Spreadsheet template:
```
Year | Revenue | Costs | Net | Your Share | Distribution
1    | $8.4M   | $2.7M | $5.7M | $219      | $219
2    | $8.4M   | $2.7M | $5.7M | $219      | $219
...
10   | $8.0M   | $2.7M | $5.3M | $204      | $204

Total return: $2,150 on $1,000 = 115% over 10 years
Annual average: 11.5%
```

#### Step 3: Technical Due Diligence

**Review technical specs:**

**Solar panels:**
- Brand: Longi Solar ✓ (Tier 1 manufacturer)
- Model: Hi-MO 5 Bifacial ✓ (proven technology)
- Warranty: 25 years ✓ (standard)
- Degradation: 0.45%/year ✓ (good)

**Inverters:**
- Brand: SolarEdge ✓ (reliable)
- Efficiency: 99.2% ✓ (excellent)
- Monitoring: Yes ✓

**Mounting:**
- Type: Single-axis tracking ✓
- Manufacturer: NEXTracker ✓ (industry leader)

**Site assessment:**
- Location: Nevada desert ✓ (ideal solar resource)
- Solar irradiance: Check NREL database
  - Annual GHI: 2,150 kWh/m²/year ✓ (excellent)
- Land: 300 acres ✓ (adequate)

**Energy production verification:**

Calculate expected output:
```
Nameplate capacity: 50 MW
Capacity factor: 27.4% (typical for desert solar)
Annual production: 50 MW × 27.4% × 8,760 hours
                 = 120,012 MWh ✓

Matches pro forma ✓
```

#### Step 4: Community & Impact Assessment

**Local engagement:**
- Community meetings held: 3 (documented)
- Local hiring commitment: 60% ✓
- Community benefit fund: $50K/year ✓
- Opposition: None documented ✓

**Impact metrics:**
- Homes powered: 12,000
- CO₂ avoided: 85,000 tons/year
- Jobs created: 150 construction + 8 permanent

**Exit to community:**
- Timeline: 10 years ✓ (standard)
- Recipient: Local energy cooperative ✓
- Preparation: Training program starting year 7 ✓

**Verify claims:**
- Cross-reference with third-party audit
- Check for community endorsements
- Look for news coverage

#### Step 5: Risk Analysis

**Identify risks:**

**Technology risk:** LOW
- Proven bifacial panel technology
- Established manufacturers
- 2+ years of field data

**Financial risk:** LOW-MEDIUM
- PPA with A-rated utility ✓
- 20-year PPA term ✓
- Letter of credit backing ✓
- Weather risk: Mitigated by insurance

**Construction risk:** MEDIUM
- 60% complete ✓
- Major equipment delivered ✓
- On schedule ✓
- Contingency fund: 3% of budget

**Regulatory risk:** LOW
- All permits approved ✓
- Environmental clearance ✓
- Interconnection agreement signed ✓
- Tax incentives locked in ✓

**Create risk matrix:**

| Risk | Probability | Impact | Mitigation | Overall |
|------|------------|--------|------------|---------|
| Weather below projections | Medium | Low | Insurance, P90 estimate | LOW |
| Construction delay | Low | Medium | Timeline buffer, penalties | LOW-MED |
| Equipment failure | Low | Medium | Warranties, O&M contract | LOW |
| PPA default | Very Low | High | Utility rating, LC | LOW |

#### Step 6: Comparison Analysis

**Compare to alternatives:**

Find 2-3 similar projects:

| Metric | Sunrise Solar | Project B | Project C |
|--------|--------------|-----------|-----------|
| Technology | Solar | Solar | Solar |
| Capacity | 50 MW | 40 MW | 60 MW |
| Stage | Construction | Operating | Planning |
| Return | 10.5% | 9.2% | 12.1% |
| Risk | Medium | Low | High |
| Rating | 4.8/5 | 4.9/5 | 4.2/5 |

**Analysis:**
- Sunrise Solar: Higher return than operating, lower than planning
- Risk-adjusted return appears fair
- Rating is strong

#### Step 7: Make Investment Decision

**Decision framework:**

**Score each pillar (1-10):**

- Financial: 9/10 (realistic, verified, good returns)
- Technical: 9/10 (proven tech, good site, strong team)
- Community: 8/10 (good engagement, clear exit plan)
- Risk: 7/10 (moderate, well-mitigated)
- Values: 9/10 (transparent, community-first)

**Overall: 8.4/10** (Excellent investment)

**Position sizing:**

Based on risk level and portfolio:
- Portfolio size: $10,000
- This project risk: Medium
- Allocation: 5-10% = $500-1,000

**Decision:** Invest $750

#### Step 8: Document Your Analysis

Create investment memo:

```markdown
# Investment Memo: Sunrise Solar Farm

Date: November 15, 2025
Amount: $750
Thesis: Attractive risk-adjusted returns in proven solar technology

## Strengths
- Proven technology and manufacturers
- Strong PPA with A-rated utility
- Excellent solar resource
- Construction progressing on schedule
- Clear community ownership path

## Risks
- Construction completion risk (moderate)
- Weather variability (mitigated by insurance)
- 60% complete (lower risk than early-stage)

## Expected Outcome
- Annual distribution: ~$79
- 10-year return: ~$790
- Exit to community: 2036

## Monitoring Plan
- Quarterly: Check construction progress
- Annual: Review actual vs projected generation
- Years 7-9: Monitor community transition prep
```

#### Verification Checklist

- [ ] Financial projections reviewed and verified
- [ ] Technical specifications checked
- [ ] Third-party validation confirmed
- [ ] Community engagement documented
- [ ] Risk analysis completed
- [ ] Comparison to alternatives done
- [ ] Investment decision documented
- [ ] Position size determined

#### Troubleshooting

**Problem:** Missing key documents

```
Solution:
- Email project sponsor
- Check if redacted for privacy
- Compare to similar projects
- Consider not investing if critical docs missing
```

**Problem:** Numbers don't add up

```
Solution:
- Email support with specific questions
- Request clarification from project team
- Use conservative assumptions
- Consider this a red flag
```

#### Next Steps

- 📊 Track actual vs projected performance
- 🔄 Apply this framework to other projects
- 📈 Refine your evaluation process
- 🤝 Share insights with community

---

## Tutorial Tips

### General Best Practices

**Before starting:**
- [ ] Read the full tutorial
- [ ] Check prerequisites
- [ ] Set aside enough time
- [ ] Have all materials ready

**During tutorial:**
- [ ] Follow steps in order
- [ ] Don't skip verification steps
- [ ] Take notes on issues
- [ ] Ask questions in Discord if stuck

**After completing:**
- [ ] Verify final outcome
- [ ] Save your work
- [ ] Review what you learned
- [ ] Try variations/experiments

### Getting Help

**Stuck on a tutorial?**

1. **Check troubleshooting section** in that tutorial
2. **Review related docs:** [Luminous Nix](luminous-nix/index.md) | [Terra Lumina](terra-lumina/index.md)
3. **Search Discord:** Someone likely had same issue
4. **Ask community:** [Discord #tutorials](https://discord.gg/luminous)
5. **Email support:** support@luminousdynamics.org

### Suggest a Tutorial

**Have an idea for a tutorial?**

We'd love to hear it!

- **Discord:** Post in #documentation
- **GitHub:** [Tutorial suggestions](https://github.com/Luminous-Dynamics/docs/discussions)
- **Email:** docs@luminousdynamics.org

**Good tutorial ideas:**
- Solve a real problem
- Step-by-step process
- Copy-paste ready
- Clear expected outcomes

---

## What's Next?

### More Tutorials Coming Soon

🚧 **In development:**

**Luminous Nix:**
- Advanced automation with scripts
- Custom LLM integration
- Enterprise deployment at scale
- Security hardening guide

**Terra Lumina:**
- Tax optimization strategies
- Portfolio rebalancing workflow
- Community project evaluation
- Secondary market trading

**Cross-product:**
- Using both products together
- Consciousness-first app development
- Sacred Trinity methodology in practice

### Tutorial Series

We're planning tutorial series on:
- 📚 **30 Days of Luminous Nix** - Daily challenges
- 💰 **Portfolio Building** - Weekly investment lessons
- 🏗️ **Real-world Projects** - Case study walkthroughs
- 🎯 **Power User Techniques** - Advanced workflows

**Want updates?** Subscribe in [Discord #announcements](https://discord.gg/luminous)

---

*\"The best way to learn is by doing. These tutorials get you doing.\"* 💚✨

*Last updated: November 15, 2025*

[Back to Home](index.md) | [Quick Reference](quick-reference.md) | [Troubleshooting](troubleshooting.md)
