# Frequently Asked Questions

## General Questions

### What is Luminous Nix?

Luminous Nix is a natural language interface for NixOS system management. Instead of memorizing complex commands or writing configuration files by hand, you can just say what you want in plain English, and Luminous Nix handles the technical details.

### Is Luminous Nix free?

Yes! Luminous Nix is **100% free and open source** under the MIT license. You can use it, modify it, and distribute it freely.

### Does it work on other Linux distributions?

No, Luminous Nix is specifically designed for NixOS. It relies on NixOS's unique declarative configuration system and wouldn't work properly on other distributions.

### Do I need to be connected to the internet?

**Initial setup**: Yes, you need internet to download the AI model (about 2-5 GB depending on your choice).

**Daily use**: Luminous Nix works entirely offline once set up. Your commands and system information never leave your computer.

### How is this different from just using NixOS normally?

Luminous Nix provides several advantages:

- **Faster**: Find and install packages in seconds instead of minutes
- **Easier**: No need to remember package names or configuration syntax
- **Safer**: Preview all changes before applying them
- **Smarter**: AI learns from your preferences and suggests optimizations
- **Accessible**: Makes NixOS usable for beginners and people with disabilities

## Privacy & Security

### Where does my data go?

**Nowhere**. Luminous Nix runs entirely on your local machine. The AI model is downloaded once and runs locally. Your commands, system information, and configurations never leave your computer.

### Which AI model does it use?

By default, Luminous Nix uses **Mistral 7B** running via Ollama. You can choose alternatives during setup:

- **Mistral 7B**: Best balance of speed and accuracy (recommended)
- **Llama 3.1 8B**: Slightly more capable, slightly slower
- **Phi-3**: Faster, less capable, good for low-end hardware

### Can the AI model be compromised?

The models are open-source and can be independently verified. We use checksums to ensure you download authentic, unmodified models. However, as with any software, we recommend:

- Download only from official sources
- Verify checksums
- Keep your system updated

### Does it need root access?

Luminous Nix needs sudo/root access **only when applying changes** to system configuration. Reading information and generating suggestions doesn't require elevated privileges.

## Compatibility

### What NixOS versions are supported?

- **NixOS 23.05 or later**: Fully supported
- **NixOS 22.11**: Mostly works, some features limited
- **NixOS 22.05 or earlier**: Not supported

### Does it work with Flakes?

Yes! Luminous Nix detects whether you're using traditional configuration or Flakes and adapts accordingly.

### Can I use it with Home Manager?

Yes, Luminous Nix understands Home Manager configurations and can help manage user-specific packages and settings.

### Does it work with NixOS containers/VMs?

Yes, Luminous Nix works in:

- NixOS containers
- NixOS VMs
- NixOS on WSL2
- NixOS running on various architectures (x86_64, aarch64)

## Features

### Can it handle complex configurations?

Yes. While Luminous Nix excels at simple tasks, it can also:

- Configure complex services (web servers, databases)
- Set up development environments
- Manage system-wide settings
- Handle multi-file configurations
- Work with imports and modules

For very complex customizations, you might still want to edit configuration files directly, but Luminous Nix can help you understand and navigate them.

### Does voice control really work?

Yes! The voice interface uses Whisper for speech recognition, which is highly accurate. However:

- **Accuracy**: ~95% in quiet environments, lower with background noise
- **Languages**: English works best, other languages experimental
- **Privacy**: All voice processing happens locally
- **Requirements**: Working microphone, 8GB+ RAM recommended

### Can I use it for automation/scripting?

Yes, Luminous Nix has a scriptable interface:

```bash
# Use --yes to skip confirmations
luminous-nix ask "install htop" --yes --apply

# Use --json for machine-readable output
luminous-nix ask "list installed packages" --json

# Pipe commands
echo "install firefox\ninstall vim\napply changes" | luminous-nix --batch
```

### How accurate is the AI?

In our testing:

- **Package search**: ~95% accuracy
- **Installation commands**: ~98% accuracy
- **Configuration changes**: ~90% accuracy
- **Troubleshooting**: ~85% accuracy

When uncertain, Luminous Nix will ask clarifying questions or offer multiple options.

## Performance

### How much RAM does it need?

- **Minimum**: 4GB (basic model, text only)
- **Recommended**: 8GB (default model, smooth performance)
- **Voice features**: 8GB+ (Whisper model requires extra memory)

### How fast is it compared to manual configuration?

Based on user reports:

| Task | Manual | Luminous Nix | Time Saved |
|------|--------|--------------|------------|
| Find a package | 2-5 min | 5-10 sec | ~20x faster |
| Install software | 3-5 min | 30-60 sec | ~5x faster |
| Configure service | 10-30 min | 2-5 min | ~6x faster |
| Debug issue | 30+ min | 5-10 min | ~5x faster |

### Does it slow down my system?

- **At rest**: Negligible impact (~50MB RAM)
- **During query**: Temporary spike (500MB-2GB for 1-5 seconds)
- **No background processing**: Only uses resources when you call it

## Troubleshooting

### "The AI gave me the wrong answer"

This can happen! If you get an incorrect suggestion:

1. **Report it**: Use `luminous-nix report-issue` to help us improve
2. **Be more specific**: Try rephrasing with more detail
3. **Double-check**: Always review changes before applying
4. **Update model**: Newer models are more accurate

### Changes aren't being applied

Check that:

- You have sudo access: `sudo echo "test"`
- You confirmed the changes when prompted
- NixOS configuration is not syntax-broken: `nixos-rebuild dry-build`
- You're using `--apply` flag or confirming in interactive mode

### "Model download is very slow"

The AI models are 2-5GB. On slow connections:

```bash
# Use a smaller model
luminous-nix setup --model phi-3  # ~2GB instead of ~5GB

# Or download separately with a download manager
# and point Luminous Nix to it
luminous-nix setup --model-path /path/to/model
```

### It doesn't understand my question

Try:

- **Be more specific**: "install chrome" → "install Google Chrome web browser"
- **Use examples**: "set up a dev environment like for building websites"
- **Ask simpler questions**: Break complex tasks into steps
- **Check phrasing**: Some technical terms work better than colloquial ones

## Development & Contributing

### Can I contribute to Luminous Nix?

Absolutely! We welcome:

- Code contributions
- Documentation improvements
- Bug reports
- Feature suggestions
- Translations
- Testing and feedback

See our [Contributing Guide](../community/contributing.md) to get started.

### How was it built?

Luminous Nix was built using the **Sacred Trinity development model**:

- **Human (solo founder)**: Vision, testing, iteration
- **Claude AI**: Architecture, implementation, problem-solving
- **Local LLM**: Domain expertise for NixOS specifics

Total development cost: ~$200/month vs. traditional $4.2M+ for equivalent team.

### What's the tech stack?

- **Language**: Python 3.11+
- **AI**: Ollama for local LLM inference
- **TUI**: Textual framework
- **Voice**: OpenAI Whisper (local), Piper TTS
- **Config parsing**: Custom NixOS configuration parser
- **Package management**: Poetry

### Where's the source code?

[github.com/Luminous-Dynamics/luminous-nix](https://github.com/Luminous-Dynamics/luminous-nix)

## Business & Philosophy

### Who's behind Luminous Nix?

Luminous Nix is developed by [Luminous Dynamics](https://luminousdynamics.org), a consciousness-first technology company. We build tools that amplify human potential rather than exploit attention.

### How do you make money if it's free?

Luminous Nix itself is free forever. It's funded by:

- **Terra Lumina**: Our renewable energy investment platform
- **Consulting**: NixOS and consciousness-first technology consulting
- **Sponsorship**: GitHub Sponsors and corporate sponsorships
- **Future services**: Potential premium features for enterprises

We're committed to keeping the core tool free and open source.

### What is "consciousness-first computing"?

Technology designed with these principles:

- **Respect attention**: Don't manipulate or exploit users
- **Amplify capability**: Make people more powerful, not more dependent
- **Maintain transparency**: Show what's happening, no hidden behavior
- **Enable sovereignty**: Users own and control their data and tools
- **Serve wellbeing**: Technology should improve human flourishing

See our [Philosophy docs](../philosophy/consciousness-first.md) for more.

### Can I use this commercially?

Yes! The MIT license allows commercial use. You can:

- Use Luminous Nix in your business
- Include it in commercial products
- Offer it as part of paid services

We only ask that you:

- Keep the MIT license notice
- Give credit where appropriate
- Consider sponsoring the project if it provides value

## Comparison to Other Tools

### How is this different from Nix assistants like manix or nix-doc?

Those are excellent search tools, but Luminous Nix goes further:

- **Natural language**: Not just keywords, full conversational queries
- **Takes action**: Doesn't just find info, can apply changes
- **Contextual**: Understands your system state and preferences
- **Learning**: Improves suggestions based on your patterns

### What about ChatGPT or Claude for NixOS help?

General AI assistants can help, but:

- **Privacy**: They require internet and send your data to servers
- **Integration**: Can't access your system or apply changes
- **Accuracy**: Less specialized in NixOS specifics
- **Speed**: Slower due to network latency

Luminous Nix is faster, more private, and more integrated.

## Advanced Usage

### Can I customize the AI's personality or responses?

Yes! You can configure response styles:

```bash
# Concise mode (minimal output)
luminous-nix config set response.style concise

# Verbose mode (detailed explanations)
luminous-nix config set response.style verbose

# Educational mode (explains why, not just how)
luminous-nix config set response.style educational
```

You can also create custom prompts in `~/.config/luminous-nix/prompts/` to guide the AI's behavior for specific tasks.

### How do I handle multi-user setups?

Luminous Nix supports several multi-user patterns:

**Option 1: System-wide installation with per-user configs**
```bash
# Admin installs system-wide
sudo nix-env -iA nixpkgs.luminous-nix

# Each user configures preferences
luminous-nix config set llm.temperature 0.7
```

**Option 2: Team shared configuration**
```bash
# Point to shared config repo
luminous-nix config set config.source git://shared-repo.git
luminous-nix config pull
```

### Can I use it with existing NixOS configurations?

Yes! Luminous Nix works with:

- **Existing configurations**: Reads and modifies your current setup
- **Complex configurations**: Handles imports, modules, and overrides
- **Version control**: Integrates with Git-tracked configurations
- **Custom modules**: Understands and works with custom NixOS modules

It won't overwrite your hand-written configurations—it makes surgical edits or asks you to review changes.

### How does rollback work exactly?

Rollback is one of Luminous Nix's superpowers:

```bash
# Simple rollback (go back one generation)
ask-nix "rollback"
ask-nix "undo last change"

# Specific generation
ask-nix "rollback to generation 42"
ask-nix "list all generations"

# Preview differences
ask-nix "what changed in generation 50?"
ask-nix "show me the diff from generation 48 to 50"
```

Each change creates a new NixOS generation. Rollback is instant (just changes a symlink) and completely safe.

### Can I use it for remote systems?

Yes, several ways:

**Option 1: SSH + Luminous Nix**
```bash
# On local machine
ssh user@remote "ask-nix 'install htop'"
```

**Option 2: Deploy configurations**
```bash
# Generate config locally
luminous-nix ask "create webserver config" --output config.nix

# Deploy to remote
nixos-rebuild switch --target-host user@remote -I nixos-config=./config.nix
```

**Option 3: Team/Enterprise deployment** (see [Deployment Guide](deployment.md))

### How do I back up my Luminous Nix configuration?

Your Luminous Nix settings are in `~/.config/luminous-nix/`. Back up with:

```bash
# Manual backup
cp -r ~/.config/luminous-nix ~/backups/luminous-nix-$(date +%Y%m%d)

# With version control
cd ~/.config/luminous-nix
git init
git add .
git commit -m "Luminous Nix configuration backup"
git remote add origin your-repo-url
git push
```

Your actual NixOS configuration is already backed up through NixOS generations!

### Can I use it to manage servers in production?

Yes, many users do! Best practices:

1. **Always use `--dry-run` first**
```bash
ask-nix "update all services" --dry-run
```

2. **Test in staging**
```bash
# Generate config
ask-nix "configure nginx for high traffic" --output staging-nginx.nix
# Test in staging environment first
```

3. **Use safety features**
```bash
# Require explicit confirmation
luminous-nix config set safety.require_confirmation true

# Enable auto-rollback on errors
luminous-nix config set safety.auto_rollback_on_error true
```

4. **Monitor and log**
```bash
# Enable detailed logging
luminous-nix config set logging.level debug
luminous-nix config set logging.file /var/log/luminous-nix.log
```

### How do I handle package conflicts?

Luminous Nix helps resolve conflicts:

```bash
# It will detect conflicts
ask-nix "install package-a and package-b"
# Output: "Warning: package-a and package-b conflict on /usr/bin/tool"

# Ask for resolution
ask-nix "resolve conflict between package-a and package-b"
# Suggests: using package overrides, different versions, or alternatives

# Manual override
ask-nix "install package-a version 2.1 and package-b with custom prefix"
```

## Migration & Integration

### I'm migrating from Ubuntu/Debian. How do I translate my setup?

Luminous Nix makes this easy:

```bash
# List your current packages (on Ubuntu)
dpkg --get-selections > ubuntu-packages.txt

# On NixOS, let Luminous Nix translate
ask-nix "install equivalents of packages in ubuntu-packages.txt"

# Or describe your setup
ask-nix "I had a LAMP stack on Ubuntu with PHP 8.1, how do I set that up here?"
```

### Can it import Docker Compose files?

Yes! Experimental feature:

```bash
ask-nix "convert docker-compose.yml to NixOS configuration"
ask-nix "set up services from this docker-compose file"
```

It will translate services to native NixOS configurations when possible, or set up Docker/Podman for containers that need it.

### How do I migrate an existing server to NixOS with Luminous Nix?

Recommended approach:

1. **Audit current setup**
```bash
# On existing server (Ubuntu/etc)
systemctl list-units --type=service --state=running > services.txt
dpkg -l > packages.txt
```

2. **Prepare NixOS configuration**
```bash
# On NixOS testing environment
ask-nix "create config matching services from services.txt"
ask-nix "add packages equivalent to packages.txt"
```

3. **Test thoroughly**
4. **Migrate during maintenance window**

Full guide: [Migration Guide](migration-guide.md)

### Can I integrate with Ansible/Terraform/other tools?

Yes:

**Ansible**: Call Luminous Nix from playbooks
```yaml
- name: Configure system with Luminous Nix
  command: luminous-nix ask "{{ nix_command }}" --yes --apply
```

**Terraform**: Use in provisioners
```hcl
provisioner "remote-exec" {
  inline = [
    "luminous-nix ask 'install docker and enable service' --yes"
  ]
}
```

**CI/CD**: Automate deployments
```bash
# In CI pipeline
luminous-nix ask "deploy application config" --apply --yes
```

## Performance & Optimization

### How do I make it faster?

Several optimization options:

**1. Use a faster model** (less capable but quicker)
```bash
luminous-nix config set llm.model phi-3  # ~2x faster
```

**2. Reduce temperature** (less creative, more deterministic)
```bash
luminous-nix config set llm.temperature 0.1
```

**3. Enable caching**
```bash
luminous-nix config set cache.enabled true
luminous-nix config set cache.ttl 3600  # 1 hour
```

**4. Use hardware acceleration**
```bash
# If you have an NVIDIA GPU
luminous-nix config set llm.device cuda
```

### My LLM queries are timing out

Common causes and solutions:

**Problem**: Model too large for available RAM
```bash
# Solution: Use smaller model
luminous-nix config set llm.model phi-3
```

**Problem**: GPU memory issues
```bash
# Solution: Force CPU usage
luminous-nix config set llm.device cpu
```

**Problem**: Context length too long
```bash
# Solution: Clear context
ask-nix "clear conversation history"
```

### Can I pre-load models to reduce first-query latency?

Yes:

```bash
# Start model server on boot
systemctl enable --user luminous-nix-server

# Or warm up on demand
luminous-nix warmup  # Loads model into RAM
```

First query after boot: ~3-5 seconds
Subsequent queries: <1 second

## Enterprise & Team Use

### Do you offer enterprise support?

Yes! Contact enterprise@luminousdynamics.org for:

- **Dedicated support**: SLA-backed response times
- **Custom deployment**: Help with large-scale rollouts
- **Training**: Team workshops and onboarding
- **Custom features**: Priority feature development
- **Compliance assistance**: Audit trails, policy enforcement
- **Integration consulting**: Connect with your existing tools

### Can we deploy this for a team of 50+ developers?

Absolutely! See our [Enterprise Deployment Guide](deployment.md#enterprise-deployment). Key features:

- **Centralized policy management**
- **Audit logging**
- **RBAC (Role-Based Access Control)**
- **Shared configuration repository**
- **Usage analytics**
- **Centralized model hosting** (reduces individual resource requirements)

###  How do we ensure consistency across team members' configurations?

**Approach 1: Shared base configuration**
```bash
# Team repository with base-config.yaml
luminous-nix config import team-base-config.yaml

# Allow local customization
luminous-nix config set local.theme dark  # Not shared
```

**Approach 2: Gitops workflow**
```bash
# All configs in Git
git clone team-nixos-configs
cd team-nixos-configs
luminous-nix config set config.source $(pwd)

# Pull updates
luminous-nix config sync
```

**Approach 3: Configuration as code**
```bash
# Generate configs from templates
ask-nix "apply team developer profile"
ask-nix "apply backend engineer configuration"
```

### What about air-gapped/offline environments?

Luminous Nix works great offline:

**Setup process**:
1. Download model on internet-connected machine
2. Export: `luminous-nix export-model --output model.tar.gz`
3. Transfer to air-gapped system
4. Import: `luminous-nix import-model model.tar.gz`

Once set up, everything works offline. Updates require repeating this process.

### Can we track who made what changes?

Yes, enable audit logging:

```bash
luminous-nix config set audit.enabled true
luminous-nix config set audit.log_file /var/log/luminous-nix-audit.log

# Logs include:
# - User
# - Timestamp
# - Command issued
# - Changes made
# - Generation number
```

For enterprise, we offer centralized audit log collection.

### How do we handle secrets/credentials in team configs?

**Never commit secrets!** Use:

**Option 1: NixOS secrets management (recommended)**
```bash
# Use agenix or sops-nix
ask-nix "set up agenix for secrets management"
```

**Option 2: External secret stores**
```bash
# Reference from Vault/AWS Secrets Manager
ask-nix "configure to use HashiCorp Vault for secrets"
```

**Option 3: Environment variables**
```bash
# In your config
services.myservice.password = "$PASSWORD";  # Read from env
```

Luminous Nix respects your secrets management approach and won't log sensitive values.

## Getting More Help

Still have questions?

- 💬 **Community Discord**: [discord.gg/luminous](https://discord.gg/luminous)
- 🐙 **GitHub Discussions**: [github.com/Luminous-Dynamics/luminous-nix/discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- 📧 **Email Support**: support@luminousdynamics.org
- 📖 **Documentation**: [docs.luminousdynamics.org](https://docs.luminousdynamics.org)

---

*This FAQ is updated regularly. Last updated: November 16, 2025*

**Don't see your question?** [Submit it on GitHub](https://github.com/Luminous-Dynamics/luminous-nix/discussions/new?category=q-a)
