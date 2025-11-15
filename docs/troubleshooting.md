# Troubleshooting Guide

Quick solutions to common problems with Luminous Nix and Terra Lumina.

## How to Use This Guide

1. **Find your product** (Luminous Nix or Terra Lumina)
2. **Locate your issue** in the table of contents
3. **Try the solutions** in order
4. **Still stuck?** See [Getting Help](#getting-help)

## Quick Navigation

**Luminous Nix:**
- [Installation Issues](#luminous-nix-installation)
- [Runtime Errors](#luminous-nix-runtime)
- [LLM Connection Problems](#luminous-nix-llm)
- [Voice Interface Issues](#luminous-nix-voice)
- [Performance Problems](#luminous-nix-performance)

**Terra Lumina:**
- [Account & Login](#terra-lumina-account)
- [KYC Verification](#terra-lumina-kyc)
- [Investment Issues](#terra-lumina-investment)
- [Payment Problems](#terra-lumina-payment)
- [Portfolio & Returns](#terra-lumina-portfolio)

**General:**
- [Common Error Messages](#common-errors)
- [Getting Help](#getting-help)

---

## Luminous Nix Troubleshooting

### Installation Issues {#luminous-nix-installation}

#### Problem: "command not found: luminous-nix" after installation

**Symptoms:**
```bash
$ luminous-nix --version
bash: luminous-nix: command not found
```

**Solutions:**

**1. Check if Nix is in your PATH**
```bash
echo $PATH | grep -q nix && echo "Nix in PATH" || echo "Nix NOT in PATH"
```

If "Nix NOT in PATH":
```bash
# Add to your ~/.bashrc or ~/.zshrc:
export PATH="$HOME/.nix-profile/bin:$PATH"
# Then reload:
source ~/.bashrc  # or source ~/.zshrc
```

**2. Verify installation**
```bash
nix profile list | grep luminous-nix
```

If not listed, reinstall:
```bash
nix profile install github:Luminous-Dynamics/luminous-nix
```

**3. Try the flake direct run**
```bash
nix run github:Luminous-Dynamics/luminous-nix -- --version
```

If this works, the issue is PATH configuration.

---

#### Problem: Flake evaluation errors

**Symptoms:**
```
error: unable to download 'https://github.com/Luminous-Dynamics/luminous-nix/...
```

**Solutions:**

**1. Check internet connection**
```bash
ping -c 3 github.com
```

**2. Update flake lock**
```bash
nix flake update github:Luminous-Dynamics/luminous-nix
```

**3. Clear nix cache**
```bash
sudo rm -rf ~/.cache/nix
nix-collect-garbage -d
```

**4. Enable flakes** (if not already)
```bash
# Add to ~/.config/nix/nix.conf or /etc/nix/nix.conf:
experimental-features = nix-command flakes
```

Restart nix daemon:
```bash
sudo systemctl restart nix-daemon
```

---

#### Problem: NixOS module not found

**Symptoms:**
```
error: attribute 'luminous-nix' missing
```

**Solution:**

Ensure proper flake input in your NixOS configuration:

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    luminous-nix.url = "github:Luminous-Dynamics/luminous-nix";
  };

  outputs = { self, nixpkgs, luminous-nix }: {
    nixosConfigurations.yourhost = nixpkgs.lib.nixosSystem {
      modules = [
        luminous-nix.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
```

Then rebuild:
```bash
sudo nixos-rebuild switch --flake .#yourhost
```

---

### Runtime Errors {#luminous-nix-runtime}

#### Problem: "Failed to parse intent" errors

**Symptoms:**
```bash
$ ask-nix "install firefox"
Error: Failed to parse intent from LLM response
```

**Solutions:**

**1. Check LLM is running**

For Ollama:
```bash
curl http://localhost:11434/api/tags
```

For OpenAI:
```bash
# Verify API key is set
echo $OPENAI_API_KEY
```

**2. Test LLM directly**
```bash
# Ollama:
curl http://localhost:11434/api/generate -d '{
  "model": "llama2",
  "prompt": "Hello"
}'

# OpenAI:
curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model": "gpt-4", "messages": [{"role": "user", "content": "Hello"}]}'
```

**3. Increase timeout**
```yaml
# ~/.config/luminous-nix/config.yaml
llm:
  timeout: 60  # seconds (default: 30)
```

**4. Try simpler command**
```bash
ask-nix "what version of nix am I running?"
```

If this works, the issue is with complex parsing. Report as bug.

---

#### Problem: "Permission denied" when executing commands

**Symptoms:**
```
Error: Permission denied: /nix/store/...
```

**Solutions:**

**1. Check if you need sudo**

Some operations require root:
```bash
# These need sudo:
sudo ask-nix "enable sshd service"
sudo ask-nix "rebuild nixos configuration"

# These don't:
ask-nix "install firefox"
ask-nix "search for text editors"
```

**2. Verify nix-daemon is running**
```bash
systemctl status nix-daemon
```

If not running:
```bash
sudo systemctl start nix-daemon
sudo systemctl enable nix-daemon
```

**3. Check user is in nix-users group**
```bash
groups | grep -q nix-users && echo "OK" || echo "Missing nix-users group"
```

Add yourself:
```bash
sudo usermod -a -G nix-users $USER
# Logout and login for changes to take effect
```

---

#### Problem: Commands execute but nothing happens

**Symptoms:**
```bash
$ ask-nix "install vim"
Successfully installed vim
$ which vim
vim not found
```

**Solutions:**

**1. Source your profile**
```bash
source ~/.nix-profile/etc/profile.d/nix.sh
```

**2. Check where package was installed**
```bash
nix profile list
```

**3. Verify binary location**
```bash
find ~/.nix-profile -name vim -type f
```

**4. Try direct path**
```bash
~/.nix-profile/bin/vim --version
```

If this works, it's a PATH issue. Add to your shell rc:
```bash
export PATH="$HOME/.nix-profile/bin:$PATH"
```

---

### LLM Connection Problems {#luminous-nix-llm}

#### Problem: Ollama connection refused

**Symptoms:**
```
Error: Connection refused to http://localhost:11434
```

**Solutions:**

**1. Check if Ollama is running**
```bash
ps aux | grep ollama
```

**2. Start Ollama**
```bash
# If installed via systemd:
systemctl --user start ollama

# Or run directly:
ollama serve
```

**3. Check Ollama port**
```bash
ss -tlnp | grep 11434
```

**4. Pull required model**
```bash
ollama pull llama2
ollama list  # verify
```

**5. Test Ollama API**
```bash
curl http://localhost:11434/api/generate -d '{
  "model": "llama2",
  "prompt": "Hello",
  "stream": false
}'
```

**6. Check Luminous Nix config**
```yaml
# ~/.config/luminous-nix/config.yaml
llm:
  provider: ollama
  ollama_url: http://localhost:11434
  model: llama2
```

---

#### Problem: OpenAI API rate limiting

**Symptoms:**
```
Error: Rate limit exceeded (OpenAI)
```

**Solutions:**

**1. Check API usage**

Visit [platform.openai.com/usage](https://platform.openai.com/usage)

**2. Switch to different model**
```yaml
llm:
  provider: openai
  model: gpt-3.5-turbo  # instead of gpt-4
```

**3. Add retry logic**
```yaml
llm:
  retry_attempts: 3
  retry_delay: 5  # seconds
```

**4. Use local Ollama instead**
```bash
ollama pull llama2
luminous-nix config set llm.provider ollama
```

---

#### Problem: LLM responses are slow

**Symptoms:**
Each command takes 30+ seconds to respond.

**Solutions:**

**For Ollama:**

**1. Use smaller model**
```bash
ollama pull llama2:7b  # instead of llama2:13b
```

**2. Increase Ollama resources**
```bash
# Set environment variables:
export OLLAMA_NUM_PARALLEL=2
export OLLAMA_MAX_LOADED_MODELS=1
systemctl --user restart ollama
```

**3. GPU acceleration** (if available)
```bash
# Check GPU support:
nvidia-smi  # for NVIDIA
# Ollama automatically uses GPU if available
```

**For OpenAI:**

**1. Reduce max_tokens**
```yaml
llm:
  max_tokens: 500  # instead of 1000
```

**2. Switch to faster model**
```yaml
llm:
  model: gpt-3.5-turbo  # faster than gpt-4
```

---

### Voice Interface Issues {#luminous-nix-voice}

#### Problem: Microphone not detected

**Symptoms:**
```
Error: No microphone devices found
```

**Solutions:**

**1. List audio devices**
```bash
arecord -l
# or
pactl list sources short
```

**2. Test microphone**
```bash
arecord -d 5 test.wav
aplay test.wav
```

**3. Check permissions**
```bash
# Add user to audio group:
sudo usermod -a -G audio $USER
# Logout and login
```

**4. Configure PulseAudio/PipeWire**
```bash
# PulseAudio:
pacmd list-sources

# PipeWire:
pw-cli ls Node | grep -A 10 "media.class = \"Audio/Source\""
```

**5. Specify device in config**
```yaml
# ~/.config/luminous-nix/config.yaml
voice:
  input_device: "hw:0,0"  # from arecord -l
```

---

#### Problem: Speech recognition not working

**Symptoms:**
Voice interface starts but doesn't recognize speech.

**Solutions:**

**1. Check Whisper model**
```bash
# Models are downloaded automatically but may fail
ls ~/.cache/whisper/
```

**2. Test recognition directly**
```bash
luminous-nix voice --test-mic
# Speak clearly and check if text appears
```

**3. Adjust sensitivity**
```yaml
voice:
  energy_threshold: 300  # lower = more sensitive
  pause_threshold: 0.8   # seconds of silence to stop
```

**4. Use different Whisper model**
```yaml
voice:
  whisper_model: "base"  # tiny, base, small, medium, large
  # larger = more accurate but slower
```

**5. Check ambient noise**
```bash
# Record 5 seconds and listen:
arecord -d 5 -f S16_LE -r 16000 ambient.wav
aplay ambient.wav
# If very noisy, increase energy_threshold
```

---

#### Problem: Text-to-speech not working

**Symptoms:**
Luminous Nix responds but no audio output.

**Solutions:**

**1. Check speakers**
```bash
speaker-test -t wav -c 2
```

**2. Test TTS directly**
```bash
echo "test" | piper --model en_US-lessac-medium --output_file test.wav
aplay test.wav
```

**3. Check Piper installation**
```bash
which piper
piper --version
```

**4. Download TTS model**
```bash
# Models in ~/.local/share/piper/
# Download manually if needed:
wget https://github.com/rhasspy/piper/releases/download/v1.2.0/en_US-lessac-medium.onnx
```

**5. Configure TTS voice**
```yaml
voice:
  tts_voice: "en_US-lessac-medium"
  tts_enabled: true
```

---

### Performance Problems {#luminous-nix-performance}

#### Problem: High CPU usage

**Symptoms:**
```bash
$ top
# luminous-nix using 100% CPU
```

**Solutions:**

**1. Check which component**
```bash
ps aux | grep -E "(ollama|luminous-nix)"
```

**2. Reduce Ollama threads** (if Ollama is the issue)
```bash
export OLLAMA_NUM_PARALLEL=1
systemctl --user restart ollama
```

**3. Use lighter LLM model**
```bash
ollama pull llama2:7b
luminous-nix config set llm.model llama2:7b
```

**4. Disable voice if not needed**
```yaml
voice:
  enabled: false
```

---

#### Problem: High memory usage

**Symptoms:**
System running out of RAM.

**Solutions:**

**1. Check memory usage**
```bash
free -h
ps aux --sort=-%mem | head
```

**2. Reduce Ollama memory**
```bash
export OLLAMA_MAX_LOADED_MODELS=1
systemctl --user restart ollama
```

**3. Unload Ollama models when idle**
```bash
ollama stop llama2
# Model will reload when needed
```

**4. Use smaller model**
```bash
ollama pull tinyllama  # ~600MB vs 7GB for llama2
```

---

## Terra Lumina Troubleshooting

### Account & Login {#terra-lumina-account}

#### Problem: Can't log in / "Invalid credentials"

**Solutions:**

**1. Reset password**

Visit [terralumina.org/reset-password](https://terralumina.org/reset-password)

**2. Check email address**

Common mistakes:
- Typo in email
- Using different email than registration
- Email not verified

**3. Clear browser cache/cookies**
```
Chrome: Settings → Privacy → Clear browsing data
Firefox: Settings → Privacy & Security → Clear Data
```

**4. Try different browser**

Sometimes browser extensions interfere.

**5. Check account status**

Account may be locked after multiple failed attempts.
Email support@luminousdynamics.org

---

#### Problem: Not receiving verification email

**Solutions:**

**1. Check spam folder**

Search for: from:terralumina.org or from:luminousdynamics.org

**2. Add to safe senders**
```
Add to contacts: noreply@terralumina.org
```

**3. Request new verification**

Visit [terralumina.org/resend-verification](https://terralumina.org/resend-verification)

**4. Check email provider**

Some providers (Gmail, Outlook) may delay emails up to 30 minutes.

**5. Use different email**

If persistent issues, try different email provider:
- Gmail
- ProtonMail
- Outlook

---

### KYC Verification {#terra-lumina-kyc}

#### Problem: KYC verification failing

**Common reasons and solutions:**

**1. Poor quality ID photo**

✅ **Do:**
- Use good lighting
- Ensure all text is readable
- Include all four corners of ID
- Use recent photo (< 6 months old)

❌ **Don't:**
- Use flash (creates glare)
- Crop too tightly
- Use black and white photo
- Submit expired ID

**2. Selfie doesn't match ID**

- Use same angle as ID photo
- Remove glasses if not in ID
- Ensure good lighting
- Look directly at camera

**3. Unsupported document type**

Accepted IDs:
- Passport (recommended)
- Driver's license
- National ID card
- Residence permit (with photo)

Not accepted:
- Student ID
- Work ID
- Birth certificate
- Social security card

**4. Name mismatch**

Ensure name on account matches ID exactly:
- Middle names/initials
- Spelling
- Order (first name first)

**5. Address verification issues**

Accepted documents for address proof:
- Utility bill (< 3 months old)
- Bank statement (< 3 months old)
- Government letter
- Lease agreement

---

#### Problem: KYC stuck in "pending" for days

**Solutions:**

**1. Check status**

Log in to account → KYC Status tab

**2. Normal processing times**
- Standard: 24-48 hours
- Peak times: up to 5 business days
- Complex cases: up to 10 business days

**3. Was additional info requested?**

Check email for requests from verification@terralumina.org

**4. Contact support**

If > 5 business days: support@luminousdynamics.org

Include:
- Account email
- Application date
- Application ID (from email)

---

### Investment Issues {#terra-lumina-investment}

#### Problem: "Investment unavailable" when trying to invest

**Reasons:**

**1. Project fully funded**

Check funding percentage. If 100%, project closed to new investments.

**2. Investment deadline passed**

Check funding deadline on project page.

**3. Investment limits reached**

- User limit: Check if you've hit project-specific limit
- Project limit: Total funding cap reached

**4. Geographic restrictions**

Some projects have country restrictions. Check "Eligible regions" on project page.

**5. KYC required**

Complete KYC verification before investing.

---

#### Problem: Minimum investment error

**Symptoms:**
```
Error: Investment amount below minimum
```

**Solution:**

Check project minimum:
- Most projects: $10 minimum
- Some large projects: $100 or $1,000 minimum
- Enterprise projects: $10,000 minimum

Displayed on project page under "Min Investment"

---

### Payment Problems {#terra-lumina-payment}

#### Problem: Credit card declined

**Solutions:**

**1. Check with bank**

Common causes:
- International transaction blocked
- Fraud prevention trigger
- Insufficient funds
- Expired card

**2. Try different card**

- Different issuer (Visa, Mastercard, Amex)
- Debit card instead of credit
- Different bank

**3. Use alternative payment method**

- Bank transfer (ACH)
- Wire transfer
- Cryptocurrency (BTC, ETH)

**4. Verify billing address**

Must match card billing address exactly.

---

#### Problem: Bank transfer not credited

**Symptoms:**
Sent bank transfer but investment not showing.

**Solutions:**

**1. Check processing time**

- ACH: 1-3 business days
- Wire transfer: 1 business day
- International wire: 2-5 business days

**2. Verify transfer details**

Check confirmation email for:
- Account number
- Routing number
- Reference number (required!)

**3. Check reference number**

**Critical:** Must include your unique reference number in transfer memo/description.

Without it, we can't match transfer to your account.

**4. Contact support**

If > 5 business days: support@luminousdynamics.org

Include:
- Transfer date
- Amount
- Last 4 digits of account transferred from
- Transfer confirmation screenshot

---

### Portfolio & Returns {#terra-lumina-portfolio}

#### Problem: Portfolio value seems wrong

**Solutions:**

**1. Understand valuation**

Portfolio value includes:
- Original investment
- Unclaimed distributions
- Accrued returns (not yet distributed)

**2. Check calculation**

```
Current Value = Investment + Distributions + Accrued Returns

Example:
Invested: $1,000
Distributions received: $80
Accrued (not yet distributed): $30
Current Value: $1,110
```

**3. Refresh portfolio**

Click refresh icon. Values update every 24 hours normally.

**4. Check individual projects**

Drill down to individual investments to see breakdown.

---

#### Problem: Haven't received distribution

**Symptoms:**
Distribution showing as "available" but not received.

**Solutions:**

**1. Check if claimed**

Distributions must be claimed before transfer:
- Portfolio → Distributions → "Claim" button

**2. Check payment method**

Ensure payment method configured:
- Portfolio → Settings → Payment Methods

**3. Check processing time**

After claiming:
- Bank transfer: 3-5 business days
- Check: 7-10 business days
- Crypto: 1-2 business days

**4. Minimum distribution amount**

Distributions < $1.00 accumulate until reaching $1.00.

**5. Verify account details**

Ensure bank account info is correct and verified.

---

## Common Error Messages {#common-errors}

### Luminous Nix

| Error | Meaning | Solution |
|-------|---------|----------|
| `ECONNREFUSED` | LLM server not reachable | Start Ollama or check OpenAI key |
| `ENOENT` | File or command not found | Check PATH or installation |
| `ETIMEDOUT` | Request timed out | Increase timeout in config |
| `EACCES` | Permission denied | Use sudo or check file permissions |
| `Invalid JSON` | LLM response malformed | Try simpler query or update LLM |

### Terra Lumina

| Error | Meaning | Solution |
|-------|---------|----------|
| `KYC_REQUIRED` | Must verify identity | Complete KYC process |
| `INSUFFICIENT_FUNDS` | Balance too low | Add funds or reduce investment |
| `INVESTMENT_UNAVAILABLE` | Project closed | Browse other projects |
| `RATE_LIMIT` | Too many requests | Wait 1 hour or upgrade tier |
| `PAYMENT_FAILED` | Payment didn't process | Check payment method |

---

## Diagnostic Commands

### Luminous Nix

**System information:**
```bash
luminous-nix --version
nix --version
uname -a
```

**Configuration check:**
```bash
luminous-nix config list
cat ~/.config/luminous-nix/config.yaml
```

**LLM connectivity:**
```bash
# Ollama:
curl http://localhost:11434/api/tags

# OpenAI:
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY"
```

**Voice system:**
```bash
arecord -l  # microphones
aplay -l    # speakers
piper --version  # TTS
```

**Logs:**
```bash
# View logs:
journalctl --user -u luminous-nix -f

# Or:
cat ~/.local/share/luminous-nix/logs/latest.log
```

### Terra Lumina

**Browser console** (for web issues):
```
1. Open developer tools (F12)
2. Click "Console" tab
3. Look for red error messages
4. Screenshot and send to support
```

**Network tab** (for API issues):
```
1. Open developer tools (F12)
2. Click "Network" tab
3. Reproduce issue
4. Look for failed requests (red)
5. Click request → "Response" tab
6. Screenshot and send to support
```

---

## Getting Help {#getting-help}

### Before Asking for Help

Please try:

1. ✅ Search this troubleshooting guide
2. ✅ Check product-specific FAQ ([Luminous Nix](luminous-nix/faq.md) | [Terra Lumina](terra-lumina/faq.md))
3. ✅ Search Discord history
4. ✅ Search GitHub issues
5. ✅ Run diagnostic commands above

### How to Ask for Help Effectively

**Include:**

1. **What you tried** - Exact command or action
2. **What happened** - Error message (copy/paste, not screenshot if possible)
3. **What you expected** - Desired outcome
4. **System info** - OS, version, configuration
5. **Logs** - Relevant log excerpts

**Example good help request:**

> **Problem:** Luminous Nix not recognizing "install" commands
>
> **What I tried:**
> ```bash
> ask-nix "install firefox"
> ```
>
> **Error:**
> ```
> Error: Failed to parse intent - unknown action
> ```
>
> **Expected:** Should install Firefox
>
> **System:**
> - Luminous Nix: 1.0.2
> - NixOS: 23.11
> - LLM: Ollama with llama2:7b
>
> **Config:**
> ```yaml
> llm:
>   provider: ollama
>   model: llama2:7b
> ```
>
> **Logs:**
> ```
> [2025-11-15 10:30:15] INFO: Received request: "install firefox"
> [2025-11-15 10:30:18] ERROR: LLM response missing 'action' field
> ```

---

### Support Channels

#### Community Support (Free, Fast)

**Discord** (recommended for quick help):
- [discord.gg/luminous](https://discord.gg/luminous)
- Channels: #luminous-nix, #terra-lumina, #troubleshooting
- Average response: < 1 hour during business hours

**GitHub Discussions:**
- [Luminous Nix](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- [Terra Lumina](https://github.com/Luminous-Dynamics/terra-lumina/discussions)
- Great for longer, searchable discussions

**Community Forum:**
- [community.luminousdynamics.org](https://community.luminousdynamics.org)
- Threaded discussions
- Searchable archive

#### Official Support (Email)

**Luminous Nix:**
- dev@luminousdynamics.org
- Response time: < 24 hours

**Terra Lumina:**
- support@luminousdynamics.org
- Response time: < 4 hours (urgent), < 24 hours (general)

**Security Issues:**
- security@luminousdynamics.org
- Encrypted: [PGP key](https://luminousdynamics.org/security.asc)

#### Office Hours

**Weekly video call support:**
- Tuesdays 2-3 PM PT
- Join via Discord voice channel
- Great for complex issues or screen sharing

#### Enterprise Support

For business/enterprise users:
- Dedicated support engineer
- SLA guarantees
- Priority response
- Email: enterprise@luminousdynamics.org

---

## Still Having Issues?

If you've tried everything in this guide and still have problems:

1. **Create detailed bug report**
   - [Luminous Nix Issues](https://github.com/Luminous-Dynamics/luminous-nix/issues)
   - [Terra Lumina Issues](https://github.com/Luminous-Dynamics/terra-lumina/issues)

2. **Emergency support**
   - For urgent issues (payment, security): support@luminousdynamics.org
   - Include "URGENT" in subject line

3. **Feature request**
   - Maybe what you're trying isn't possible yet
   - [Submit feature request](https://github.com/Luminous-Dynamics/luminous-nix/discussions/categories/ideas)

---

## Contributing to This Guide

Found a solution not listed here? Help others!

- **Edit this page** on GitHub
- **Share in Discord** #documentation channel
- **Email** docs@luminousdynamics.org

Every contribution makes the product better for everyone. 💚

---

*\"The best troubleshooting is empowering users to solve problems themselves.\"*

*Last updated: November 15, 2025*

[Back to Docs Home](index.md) | [Luminous Nix FAQ](luminous-nix/faq.md) | [Terra Lumina FAQ](terra-lumina/faq.md)
