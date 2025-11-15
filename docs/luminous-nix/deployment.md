# Advanced Deployment & Operations Guide

**Production-grade deployment, scaling, security, and operational best practices for Luminous Nix.**

---

## Overview

This guide covers enterprise-grade deployment of Luminous Nix for teams, organizations, and production environments.

**Who this is for:**
- DevOps engineers deploying Luminous Nix at scale
- System administrators managing teams
- Enterprise IT planning production rollouts
- Security teams evaluating deployment requirements

**What you'll learn:**
- Production deployment architectures
- Security hardening and compliance
- Scaling to multiple users and machines
- Monitoring, logging, and observability
- Backup, disaster recovery, and business continuity
- Enterprise integration patterns

---

## Deployment Architectures

### Single User Deployment (Development)

**Use case:** Individual developer or sysadmin

**Architecture:**
```
┌─────────────────┐
│  User Machine   │
│                 │
│  ┌───────────┐ │
│  │ Luminous  │ │
│  │   Nix     │ │
│  └─────┬─────┘ │
│        │       │
│  ┌─────▼─────┐ │
│  │   Local   │ │
│  │   LLM     │ │
│  │ (Ollama)  │ │
│  └───────────┘ │
└─────────────────┘
```

**Installation:**
```bash
# Standard install
nix-env -iA nixpkgs.luminous-nix

# Configure local LLM
luminous-nix config set llm.provider ollama
luminous-nix config set llm.model llama2

# Test
ask-nix "show system info"
```

**Resources:**
- CPU: 2+ cores
- RAM: 8GB minimum (4GB system + 4GB LLM)
- Disk: 20GB (10GB Nix store + 5GB LLM models + 5GB buffer)

**Pros:**
✅ Simple setup
✅ Complete privacy (local LLM)
✅ No network dependencies

**Cons:**
❌ Single point of failure
❌ No collaboration features
❌ Manual backup responsibility

---

### Team Deployment (Small Team)

**Use case:** 3-15 person team sharing configurations

**Architecture:**
```
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   User 1     │  │   User 2     │  │   User 3     │
│              │  │              │  │              │
│  Luminous    │  │  Luminous    │  │  Luminous    │
│    Nix       │  │    Nix       │  │    Nix       │
└──────┬───────┘  └──────┬───────┘  └──────┬───────┘
       │                 │                 │
       └─────────────────┼─────────────────┘
                         │
                  ┌──────▼──────┐
                  │  Shared Git │
                  │  Repository │
                  │             │
                  │  - Configs  │
                  │  - Scripts  │
                  │  - Policies │
                  └─────────────┘
```

**Setup:**

1. **Create shared config repository:**
```bash
# On shared Git server
mkdir luminous-nix-team-config
cd luminous-nix-team-config
git init

# Create base configuration
cat > base-config.yaml <<EOF
llm:
  provider: ollama
  model: llama2

safety:
  require_confirmation: true
  dry_run_default: false

team:
  shared_configs: true
  config_repo: git@github.com:company/luminous-configs.git
EOF

git add base-config.yaml
git commit -m "Base team configuration"
git push origin main
```

2. **Each team member:**
```bash
# Clone team configs
git clone git@github.com:company/luminous-configs.git ~/.luminous-nix-team

# Link to Luminous Nix
luminous-nix config import ~/.luminous-nix-team/base-config.yaml

# Override personal preferences
luminous-nix config set voice.enabled true  # Personal choice
```

3. **Share common workflows:**
```bash
# In team repo, create workflows/
mkdir workflows

# Example: dev environment setup
cat > workflows/dev-env.sh <<EOF
#!/bin/bash
ask-nix "install nodejs, python3, docker, and git"
ask-nix "enable docker service and add me to docker group"
ask-nix "install vim, tmux, and htop"
EOF

chmod +x workflows/dev-env.sh
```

**Team members can run:**
```bash
~/.luminous-nix-team/workflows/dev-env.sh
```

**Pros:**
✅ Shared standards
✅ Easy onboarding (clone repo)
✅ Version controlled configs
✅ Team collaboration

**Cons:**
⚠️ Manual config sync (git pull)
⚠️ No central policy enforcement
⚠️ Each user manages own LLM

---

### Enterprise Deployment (Large Organization)

**Use case:** 50+ users, centralized management, compliance requirements

**Architecture:**
```
                  ┌──────────────────┐
                  │  Management      │
                  │  Console         │
                  │                  │
                  │  - User mgmt     │
                  │  - Policies      │
                  │  - Audit logs    │
                  │  - Compliance    │
                  └────────┬─────────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
  ┌──────▼──────┐   ┌──────▼──────┐   ┌──────▼──────┐
  │   Shared    │   │  Centralized│   │   Audit     │
  │   Config    │   │     LLM     │   │   Logging   │
  │   Service   │   │  (Optional) │   │   Service   │
  └──────┬──────┘   └──────┬──────┘   └──────┬──────┘
         │                 │                 │
         └─────────────────┼─────────────────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
  ┌──────▼──────┐   ┌──────▼──────┐   ┌──────▼──────┐
  │   User 1    │   │   User 2    │   │   User 3    │
  │  Luminous   │   │  Luminous   │   │  Luminous   │
  │    Nix      │   │    Nix      │   │    Nix      │
  └─────────────┘   └─────────────┘   └─────────────┘
```

**Enterprise Features (Coming Q2-Q3 2026):**

1. **Centralized Management Console**
   - Web-based admin interface
   - User and group management
   - Policy creation and enforcement
   - Audit log viewing
   - Compliance reporting

2. **Policy Enforcement**
   - Require specific safety settings
   - Blacklist/whitelist packages
   - Enforce multi-factor confirmation for sensitive operations
   - Automatic rollback policies

3. **Centralized LLM (Optional)**
   - Shared API-based LLM (cost efficiency)
   - Central model fine-tuning
   - Usage analytics and optimization
   - Still supports local LLM for privacy-sensitive users

4. **Audit & Compliance**
   - All commands logged centrally
   - Tamper-proof audit trail
   - Compliance report generation (SOC 2, ISO 27001)
   - Integration with SIEM systems

**Current Workaround (Until Enterprise Features Ship):**

```bash
# Use Ansible/Chef/Puppet to manage Luminous Nix deployment
# Example Ansible playbook:

- name: Deploy Luminous Nix Enterprise
  hosts: all_workstations
  tasks:
    - name: Install Luminous Nix
      command: nix-env -iA nixpkgs.luminous-nix

    - name: Deploy enterprise configuration
      copy:
        src: files/enterprise-config.yaml
        dest: /etc/luminous-nix/config.yaml

    - name: Enable audit logging
      lineinfile:
        path: /etc/luminous-nix/config.yaml
        line: 'audit_log: /var/log/luminous-nix/audit.log'

    - name: Set up log forwarding to central SIEM
      copy:
        src: files/rsyslog-luminous.conf
        dest: /etc/rsyslog.d/luminous-nix.conf
      notify: restart rsyslog
```

---

## Security Hardening

### Principle of Least Privilege

**Default (Development):**
- User runs Luminous Nix with their own permissions
- Can install packages, modify system (if sudo available)
- Voice interface listens locally

**Hardened (Production):**

1. **Separate service account:**
```bash
# Create luminous-nix service user
sudo useradd -r -s /bin/false luminous-nix-svc

# Install as service user
sudo -u luminous-nix-svc nix-env -iA nixpkgs.luminous-nix

# Grant specific sudo permissions
# /etc/sudoers.d/luminous-nix
Cmnd_Alias LUMINOUS_ALLOWED = \
    /run/current-system/sw/bin/nix-env *, \
    /run/current-system/sw/bin/systemctl start *, \
    /run/current-system/sw/bin/systemctl stop *, \
    /run/current-system/sw/bin/systemctl restart *

luminous-nix-svc ALL=(ALL) NOPASSWD: LUMINOUS_ALLOWED

# Deny everything else
luminous-nix-svc ALL=(ALL) !ALL
```

2. **Command whitelist/blacklist:**
```yaml
# /etc/luminous-nix/security-policy.yaml
command_policy:
  mode: whitelist  # or "blacklist"

  whitelist:
    - install_package
    - remove_package
    - enable_service
    - disable_service
    - restart_service
    - show_info

  blacklist:
    - delete_files  # Never allow file deletion
    - format_disk   # Never allow disk formatting
    - shutdown_system  # Require manual shutdown

  require_approval:
    - modify_firewall
    - add_user
    - change_permissions
```

3. **Multi-factor confirmation for sensitive ops:**
```yaml
# Require additional confirmation for:
multi_factor_operations:
  - system_upgrade
  - kernel_modification
  - firewall_changes
  - user_management

confirmation:
  method: yubikey  # or "totp", "sms", "email"
  timeout: 60  # seconds
```

### Network Security

**1. Local LLM only (air-gapped):**
```yaml
llm:
  provider: ollama
  ollama_url: http://localhost:11434
  allow_external: false  # Block any external API calls
```

**2. Firewall rules for LLM access:**
```bash
# Allow only local Ollama
sudo ufw allow from 127.0.0.1 to 127.0.0.1 port 11434

# Block all external LLM APIs
sudo ufw deny out to any port 443 proto tcp comment "Block external AI APIs"

# Exception for specific internal LLM server
sudo ufw allow out to 10.0.1.100 port 11434 proto tcp comment "Internal LLM server"
```

**3. Voice interface security:**
```yaml
voice:
  enabled: true
  wake_word: "hey nix"

  # Security settings
  require_proximity: true  # Require physical presence (USB token)
  record_audio: false  # Don't save audio files
  local_processing_only: true  # Never send audio to cloud

  # Disable remote voice access
  network_voice: false
```

### Audit Logging

**Comprehensive audit trail:**
```yaml
# /etc/luminous-nix/config.yaml
audit:
  enabled: true
  log_file: /var/log/luminous-nix/audit.log
  log_level: detailed  # minimal, standard, detailed, verbose

  log_events:
    - command_received
    - command_parsed
    - plan_generated
    - user_confirmation
    - execution_started
    - execution_completed
    - errors_encountered
    - rollback_performed

  include_context:
    user: true
    timestamp: true
    ip_address: true
    session_id: true
    full_command: true
    system_state_before: true
    system_state_after: true

  retention: 365  # days

  # Forward to SIEM
  siem_integration:
    enabled: true
    syslog_server: siem.company.com
    syslog_port: 514
    format: CEF  # or "LEEF", "JSON"
```

**Example audit log entry:**
```json
{
  "timestamp": "2025-11-15T14:32:18Z",
  "event": "command_executed",
  "user": "alice@company.com",
  "session_id": "a3b5c7d9",
  "ip_address": "10.0.2.45",
  "command": "install docker and enable it",
  "parsed_intent": {
    "action": "install_and_enable_service",
    "packages": ["docker"],
    "services": ["docker"]
  },
  "approval": {
    "required": true,
    "method": "explicit_confirmation",
    "timestamp": "2025-11-15T14:32:25Z"
  },
  "execution": {
    "success": true,
    "duration_ms": 12453,
    "changes": [
      "installed docker-20.10.21",
      "enabled docker.service",
      "added user alice to docker group"
    ]
  },
  "system_state": {
    "before_hash": "abc123...",
    "after_hash": "def456..."
  }
}
```

### Compliance

**SOC 2 Compliance Considerations:**

1. **Access Control (CC6.1)**
   - ✅ User authentication (system login)
   - ✅ Command confirmation (explicit approval)
   - ✅ Audit logging (all actions logged)
   - ✅ Least privilege (configurable permissions)

2. **Change Management (CC8.1)**
   - ✅ All changes logged
   - ✅ Rollback capability
   - ✅ System state tracking
   - ✅ Change approval workflow

3. **Data Protection (CC6.6)**
   - ✅ Local LLM option (data stays on-premise)
   - ✅ No telemetry without consent
   - ✅ Encrypted audit logs (optional)

**ISO 27001 Compliance:**

- ✅ A.9 Access Control
- ✅ A.12 Operations Security
- ✅ A.12.4 Logging and Monitoring
- ✅ A.18.1 Compliance with legal requirements

**PCI DSS (if applicable):**

Luminous Nix doesn't handle payment data, but if deployed in PCI environment:
- Requirement 10: Track and monitor all access (✅ Audit logging)
- Requirement 8: Identify and authenticate access (✅ User auth)

---

## Scaling Strategies

### Vertical Scaling (More Powerful Hardware)

**When to scale vertically:**
- Single user needs faster LLM responses
- Running larger local models (13B, 30B parameters)
- Voice interface requires real-time processing

**Recommendations:**

| Use Case | CPU | RAM | GPU | Disk |
|----------|-----|-----|-----|------|
| Basic (7B model) | 4 cores | 8GB | Optional | 20GB |
| Standard (13B model) | 8 cores | 16GB | Optional | 40GB |
| Advanced (30B model) | 16 cores | 32GB | RTX 3060+ | 80GB |
| Enterprise (fine-tuned) | 32 cores | 64GB | A100 | 200GB |

**GPU acceleration:**
```bash
# Install CUDA support for Ollama
nix-env -iA nixpkgs.cudatoolkit

# Configure Ollama to use GPU
export CUDA_VISIBLE_DEVICES=0
systemctl --user restart ollama

# Test GPU usage
ask-nix "show GPU utilization"
```

**Performance gains with GPU:**
- 7B model: 3x faster (1.5s → 0.5s response)
- 13B model: 5x faster (5s → 1s response)
- 30B model: 10x faster (20s → 2s response)

### Horizontal Scaling (Multiple Machines)

**Coming Q3 2026: Multi-machine management**

**Planned architecture:**
```
┌──────────────────┐
│  Control Node    │
│  (Management)    │
│                  │
│  Luminous Nix    │
│  Controller      │
└────────┬─────────┘
         │
    ┌────┼────┬────────┐
    │    │    │        │
┌───▼──┐┌▼───┐┌▼──────┐│
│Node 1││Node││Node N ││
│      ││ 2  ││       ││
│ LNix ││LNix││ LNix  ││
└──────┘└────┘└───────┘│
```

**Future capabilities:**
```bash
# Manage all nodes from control node
ask-nix --target "all web servers" "install nginx and enable it"
ask-nix --target "database servers" "upgrade postgres to latest"
ask-nix --target "node1,node2,node3" "rollback last change"

# Get status across fleet
ask-nix --target all "what's the disk usage?"
```

**Current workaround:**
Use Ansible/NixOps to manage multiple machines:
```yaml
# Ansible playbook
- name: Install package across fleet
  hosts: all_servers
  tasks:
    - name: Use Luminous Nix to install
      shell: ask-nix "install {{ package_name }}" -y
      become: true
```

---

## Monitoring & Observability

### Health Checks

**Monitor Luminous Nix service:**
```bash
# Systemd service health
systemctl status luminous-nix

# Check LLM availability
curl http://localhost:11434/api/tags

# Test end-to-end
timeout 30s ask-nix "system status" || echo "ALERT: Luminous Nix not responding"
```

**Automated health check (cron):**
```bash
# /etc/cron.d/luminous-nix-health
*/5 * * * * root /usr/local/bin/luminous-health-check.sh

# /usr/local/bin/luminous-health-check.sh
#!/bin/bash
RESULT=$(timeout 10s ask-nix "echo test" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "CRITICAL: Luminous Nix health check failed"  logger -t luminous-health
    # Alert ops team
    curl -X POST https://alerts.company.com/webhook \
        -d '{"service": "luminous-nix", "status": "down", "host": "'$(hostname)'"}'
fi
```

### Performance Metrics

**Track key metrics:**

1. **Response time:**
```bash
# Log response times
cat /var/log/luminous-nix/performance.log
# 2025-11-15 14:30:15 | Command: install vim | Parse: 0.5s | Plan: 2.1s | Execute: 3.8s | Total: 6.4s
```

2. **LLM utilization:**
```bash
# Monitor Ollama
ollama ps
# NAME            ID              SIZE    PROCESSOR    UNTIL
# llama2:latest   8934d96d3f08   3.8 GB  100% CPU     4 minutes from now
```

3. **Resource usage:**
```bash
# Luminous Nix daemon
ps aux | grep luminous
# USER    PID  %CPU %MEM    VSZ   RSS
# root    1234  0.3  2.1 245680 87320

# Ollama (LLM)
ps aux | grep ollama
# USER    PID  %CPU %MEM    VSZ     RSS
# user    5678 15.2 45.3 8234560 3845120
```

### Integration with Monitoring Tools

**Prometheus metrics export:**
```yaml
# /etc/luminous-nix/config.yaml (Coming Q2 2026)
monitoring:
  prometheus:
    enabled: true
    port: 9100
    metrics:
      - command_duration_seconds
      - command_success_rate
      - llm_response_time_seconds
      - system_changes_total
      - rollback_count
```

**Grafana dashboard:**
```
┌────────────────────────────────────────┐
│  Luminous Nix Monitoring Dashboard     │
├────────────────────────────────────────┤
│                                        │
│  Commands/hour: [Graph]                │
│  Avg response time: 3.2s               │
│  Success rate: 98.5%                   │
│  Active users: 23                      │
│                                        │
│  Top Commands:                         │
│  1. install package (45%)              │
│  2. system info (23%)                  │
│  3. enable service (18%)               │
│                                        │
│  LLM Performance:                      │
│  [Response time graph]                 │
│  P50: 2.1s | P95: 4.8s | P99: 12.3s   │
└────────────────────────────────────────┘
```

---

## Backup & Disaster Recovery

### What to Back Up

**Critical data:**
1. Configuration files: `/etc/luminous-nix/`
2. User configs: `~/.config/luminous-nix/`
3. Audit logs: `/var/log/luminous-nix/`
4. LLM models: `~/.ollama/models/`
5. System state snapshots (automatic with NixOS)

### Backup Strategy

**Daily automated backups:**
```bash
#!/bin/bash
# /usr/local/bin/backup-luminous-nix.sh

BACKUP_DIR="/backup/luminous-nix/$(date +%Y-%m-%d)"
mkdir -p "$BACKUP_DIR"

# Back up configs
cp -r /etc/luminous-nix "$BACKUP_DIR/etc"
cp -r ~/.config/luminous-nix "$BACKUP_DIR/user-config"

# Back up audit logs
cp -r /var/log/luminous-nix "$BACKUP_DIR/logs"

# Back up LLM models (large, maybe weekly)
if [[ $(date +%u) -eq 1 ]]; then  # Monday only
    cp -r ~/.ollama/models "$BACKUP_DIR/models"
fi

# Compress
tar -czf "$BACKUP_DIR.tar.gz" "$BACKUP_DIR"
rm -rf "$BACKUP_DIR"

# Upload to S3/backup server
aws s3 cp "$BACKUP_DIR.tar.gz" s3://company-backups/luminous-nix/

# Retention: Keep 30 days
find /backup/luminous-nix -name "*.tar.gz" -mtime +30 -delete
```

### Disaster Recovery

**Scenario 1: User accidentally broke system**
```bash
# NixOS makes this trivial
ask-nix "rollback to previous system state"

# Or manually
sudo nixos-rebuild switch --rollback
```

**Scenario 2: Luminous Nix corrupted**
```bash
# Reinstall Luminous Nix
nix-env -e luminous-nix
nix-env -iA nixpkgs.luminous-nix

# Restore configs from backup
tar -xzf /backup/luminous-nix/latest.tar.gz
cp -r backup/etc/* /etc/luminous-nix/
cp -r backup/user-config/* ~/.config/luminous-nix/

# Restart
systemctl restart luminous-nix
```

**Scenario 3: Complete system failure**
```bash
# 1. Rebuild NixOS from configuration
nixos-install --root /mnt

# 2. Boot into new system
reboot

# 3. Restore Luminous Nix
nix-env -iA nixpkgs.luminous-nix

# 4. Restore from backup
# (same as Scenario 2)

# 5. Verify
ask-nix "show system info"
```

**Recovery Time Objectives (RTO):**
- Scenario 1 (rollback): < 2 minutes
- Scenario 2 (reinstall): < 15 minutes
- Scenario 3 (full rebuild): < 4 hours

---

## Enterprise Integration

### SSO / Active Directory

**Coming Q2 2026: SSO integration**

**Planned support:**
- SAML 2.0
- OAuth 2.0 / OpenID Connect
- LDAP / Active Directory
- Okta, Azure AD, Google Workspace

**Example config (future):**
```yaml
authentication:
  method: saml
  saml:
    idp_url: https://sso.company.com/saml
    entity_id: luminous-nix
    certificate_path: /etc/luminous-nix/saml-cert.pem

  authorization:
    admin_group: CN=LuminousAdmins,OU=Groups,DC=company,DC=com
    user_group: CN=LuminousUsers,OU=Groups,DC=company,DC=com
```

### Integration with Existing Tools

**1. Ansible:**
```yaml
# Use Luminous Nix within Ansible
- name: Install packages via Luminous Nix
  shell: ask-nix "install {{ item }}" -y
  loop:
    - vim
    - git
    - docker
```

**2. Terraform:**
```hcl
# Provision infrastructure, then configure with Luminous Nix
resource "aws_instance" "web" {
  ami = "ami-nixos"

  provisioner "remote-exec" {
    inline = [
      "nix-env -iA nixpkgs.luminous-nix",
      "ask-nix 'install nginx and enable it' -y"
    ]
  }
}
```

**3. CI/CD (GitHub Actions, GitLab CI):**
```yaml
# .github/workflows/deploy.yml
name: Deploy with Luminous Nix
on: [push]
jobs:
  deploy:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v2
      - name: Deploy application
        run: |
          ask-nix "install nodejs and npm" -y
          ask-nix "restart application service" -y
```

---

## Operational Runbooks

### Common Operations

**Onboard new user:**
```bash
# 1. Create system account
sudo useradd -m -s /bin/bash newuser

# 2. Install Luminous Nix for user
sudo -u newuser nix-env -iA nixpkgs.luminous-nix

# 3. Deploy team config
sudo -u newuser git clone git@company/luminous-configs.git ~/.luminous-nix-team
sudo -u newuser luminous-nix config import ~/.luminous-nix-team/base-config.yaml

# 4. Grant permissions (if needed)
sudo usermod -aG docker newuser

# 5. Test
sudo -u newuser ask-nix "show system info"
```

**Rotate LLM models:**
```bash
# 1. Download new model
ollama pull llama2:latest

# 2. Test new model
luminous-nix config set llm.model llama2:latest
ask-nix "echo test"

# 3. If good, update team config
# Edit team config repo, push change

# 4. All team members pull new config
# They run: git pull && luminous-nix config reload
```

**Handle security incident:**
```bash
# 1. Disable Luminous Nix immediately
sudo systemctl stop luminous-nix

# 2. Review audit logs
sudo grep "$(date +%Y-%m-%d)" /var/log/luminous-nix/audit.log

# 3. Identify suspicious activity
# Look for: unexpected installs, service changes, user modifications

# 4. Rollback if needed
sudo nixos-rebuild switch --rollback

# 5. Investigate root cause

# 6. Re-enable with additional safeguards
# Update security policy, restart
sudo systemctl start luminous-nix
```

---

## Performance Tuning

### LLM Optimization

**Choose right model size:**

| Model | Params | RAM | Speed | Quality |
|-------|--------|-----|-------|---------|
| llama2:7b | 7B | 4GB | Fast (1-2s) | Good |
| llama2:13b | 13B | 8GB | Medium (3-5s) | Better |
| llama2:30b | 30B | 16GB | Slow (8-15s) | Best |

**Recommendation:**
- Development: 7B (speed matters)
- Production: 13B (balance)
- Critical systems: 30B (accuracy matters)

**Model caching:**
```yaml
# Keep model loaded in memory
ollama_settings:
  keep_alive: "24h"  # Model stays loaded for 24 hours

# Pre-load on boot
# /etc/systemd/system/ollama-preload.service
[Unit]
Description=Preload Ollama models
After=ollama.service

[Service]
Type=oneshot
ExecStart=/usr/bin/ollama run llama2

[Install]
WantedBy=multi-user.target
```

### Network Optimization

**Local LLM preferred:**
```yaml
llm:
  provider: ollama  # Local, no network latency
  fallback_provider: openai  # If local fails
```

**If using API-based LLM:**
```yaml
llm:
  provider: openai
  api_endpoint: https://api.openai.com/v1
  timeout: 30  # seconds
  retry: 3

  # Use faster models for simple queries
  model_routing:
    simple: gpt-3.5-turbo  # Fast, cheap
    complex: gpt-4  # Slower, better
```

---

## Troubleshooting Guide

### Common Issues

**Issue: Slow responses**

Symptoms:
```
$ ask-nix "install vim"
[Waiting 30+ seconds...]
```

Diagnosis:
```bash
# Check LLM status
ollama ps
# If no models running, LLM is loading

# Check resource usage
top  # Is CPU at 100%? Is RAM swapping?
```

Solutions:
1. Use smaller model (7B instead of 13B)
2. Add more RAM
3. Pre-load model on boot
4. Use GPU acceleration

**Issue: Command not understood**

Symptoms:
```
$ ask-nix "get me docker"
Error: Could not parse intent
```

Solutions:
1. Rephrase: `ask-nix "install docker"`
2. Be more specific: `ask-nix "install docker engine for containers"`
3. Use fallback: `ask-nix "help me install docker"` (asks for clarification)

**Issue: Permission denied**

Symptoms:
```
$ ask-nix "install nginx"
Error: Permission denied
```

Solutions:
1. Add sudo: `sudo ask-nix "install nginx"`
2. Check sudoers config
3. Verify user permissions

---

## Next Steps

**Ready to deploy?**

1. **Start small:** Single user deployment first
2. **Test thoroughly:** Try all common operations
3. **Expand gradually:** Add team members one at a time
4. **Monitor closely:** Watch logs and metrics
5. **Iterate:** Improve based on real usage

**Need enterprise features?**

- Email: enterprise@luminousdynamics.org
- Early access: Join enterprise beta (Q2 2026)
- Custom deployment: Professional services available

---

*Production-grade deployment takes planning. Start simple, scale smart.* 💪

[Back to Luminous Nix](index.md) | [User Guide](user-guide.md) | [API Reference](api.md)
