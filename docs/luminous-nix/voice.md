# Voice Interface Guide

Control Luminous Nix with your voice for hands-free, accessible system management.

## Overview

The Luminous Nix voice interface uses **OpenAI Whisper** for speech recognition and **Piper TTS** for text-to-speech, running entirely locally on your machine for privacy.

**Key features:**

- 🎤 **Accurate speech recognition** (~95% in quiet environments)
- 🔒 **Fully offline** - No data sent to cloud services
- ♿ **Accessibility-first** - Designed for blind and low-vision users
- 🌍 **Multi-language support** (English works best)
- ⚡ **Real-time responses** - Minimal latency

## Prerequisites

### System Requirements

- **RAM:** 8GB minimum (Whisper model requires ~2-3GB)
- **Disk:** 2GB free space for voice models
- **Microphone:** Any USB or built-in mic
- **CPU:** Modern multi-core (voice processing is CPU-intensive)
- **NixOS:** 23.05 or later

### Software Requirements

Luminous Nix handles installation automatically, but you'll need:

- Python 3.11+
- ALSA or PulseAudio for audio
- Working microphone drivers

## Initial Setup

### 1. Install Voice Support

```bash
# If you installed Luminous Nix without voice support
luminous-nix setup --add-voice

# Or during initial setup
luminous-nix setup
# Select "Yes" when prompted for voice features
```

This will:

1. Download Whisper model (~1.5GB, one-time)
2. Download Piper TTS voices (~500MB, one-time)
3. Test microphone and audio output
4. Configure voice settings

**Download time:** 5-15 minutes depending on connection

### 2. Test Microphone

```bash
# Test mic input
luminous-nix voice --test-mic

# You should see:
🎤 Microphone test
Recording 5 seconds... Speak now!
[visual waveform appears]

Playback:
[you hear your recording]

✓ Microphone working correctly!
```

**Troubleshooting:**

If microphone test fails:

```bash
# List available microphones
arecord -l

# Set specific microphone
luminous-nix config set voice.microphone "hw:0,0"

# Test again
luminous-nix voice --test-mic
```

### 3. Test Speech Recognition

```bash
# Quick recognition test
luminous-nix voice --test-recognition

# Speak clearly: "Install Firefox"

# You should see:
🎤 Listening...
🧠 Understood: "install firefox"
✓ Recognition working correctly!
```

### 4. Test Text-to-Speech

```bash
# Test TTS output
luminous-nix voice --test-tts

# You should hear:
"Hello! Luminous Nix voice interface is working correctly."
```

## Using Voice Control

### Starting Voice Mode

```bash
# Start voice interface
luminous-nix voice

# Or use the shortcut
voice-nix
```

You'll see:

```
╔═══════════════════════════════════════════╗
║   Luminous Nix Voice Interface v1.0       ║
╠═══════════════════════════════════════════╣
║                                           ║
║   Press SPACE to talk                     ║
║   Press Q to quit                         ║
║   Press H for help                        ║
║                                           ║
║   Status: 🎤 Ready to listen              ║
║                                           ║
╚═══════════════════════════════════════════╝
```

### Basic Interaction Flow

1. **Press SPACE** to activate listening
2. **Speak your command** clearly
3. **Release SPACE** when done
4. **Luminous Nix processes** and responds
5. **Hear the response** via TTS
6. **Confirm or cancel** as needed

### Example Session

```
You: [SPACE] "What is my NixOS version?"

Nix: "You're running NixOS version 23.11.
      Would you like me to check for updates?"

You: "Yes"

Nix: "Checking for updates...
      No updates available. Your system is current."

You: [SPACE] "Install htop"

Nix: "I'll install htop, a system monitor.
      This will add htop to your system packages.
      Proceed?"

You: "Yes"

Nix: "Installing htop... Done.
      You can now run htop from the command line."
```

## Voice Commands

### Package Management

```
"Install Firefox"
"Remove vim"
"Search for markdown editors"
"Update all packages"
"List installed packages"
"Show me python packages"
```

### System Configuration

```
"Enable Docker"
"Disable printing"
"Start SSH service"
"Show system status"
"What services are running?"
```

### Development Environments

```
"Create a Python development environment"
"Set up Rust development"
"I need Node.js for web development"
```

### Information Queries

```
"What is my NixOS version?"
"How much disk space is left?"
"Show memory usage"
"List my user groups"
```

### Help and Learning

```
"How do I install software?"
"What is a dev shell?"
"Explain system generations"
"Help with Docker"
```

### Voice Interface Control

```
"Speak slower" / "Speak faster"
"Speak louder" / "Speak quieter"
"Switch to English" / "Use Spanish"
"Pause listening"
"Exit" / "Quit"
```

## Tips for Best Results

### Speaking Clearly

✅ **Do:**
- Speak at normal conversational pace
- Use natural language (not commands)
- Pause briefly between phrases
- Be in a quiet environment
- Position mic 6-12 inches from mouth

❌ **Avoid:**
- Shouting or whispering
- Very fast or slurred speech
- Background noise (TV, music)
- Speaking too close to mic (pops/distortion)

### Phrasing Commands

**Natural phrasing works best:**

✅ "I want to install Firefox browser"
✅ "Can you enable Docker for me?"
✅ "Show me what services are running"

**You can also use short commands:**

✅ "Install Firefox"
✅ "Enable Docker"
✅ "System status"

**Avoid overly complex sentences:**

❌ "I would like you to install Firefox and also enable Docker and then show me the system status and check for updates"

**Instead, break into multiple commands:**

✅ "Install Firefox"
   [wait for response]
   "Enable Docker"
   [wait for response]
   "System status"

## Advanced Features

### Continuous Listening Mode

Stay in listening mode without pressing space:

```bash
luminous-nix voice --continuous

# Now just speak, no need to press space
# Say "pause" to stop listening
# Say "resume" to start again
```

**Use case:** Hands-free operation, accessibility

**Note:** Higher CPU usage in continuous mode

### Wake Word (Experimental)

Activate with a wake word:

```bash
luminous-nix voice --wake-word "hey nix"

# Now say "Hey Nix" followed by your command
# Example: "Hey Nix, install Firefox"
```

**Wake words:**
- "hey nix"
- "okay nix"
- "luminous"

**Accuracy:** ~85% in quiet environments

### Custom Voice

Change TTS voice:

```bash
# List available voices
luminous-nix voice --list-voices

# Set voice
luminous-nix config set voice.tts_voice "en_US-lessac-medium"

# Voice options:
# - en_US-lessac-medium (female, clear)
# - en_US-ryan-medium (male, warm)
# - en_US-libritts-high (neutral, precise)
```

### Adjust Speech Rate

```bash
# Faster speech (useful for experienced users)
luminous-nix config set voice.speech_rate 1.3

# Slower speech (useful for learning)
luminous-nix config set voice.speech_rate 0.8

# Default: 1.0
```

### Keyboard Shortcuts

While in voice mode:

| Key | Action |
|-----|--------|
| **SPACE** | Press to talk (default) |
| **CTRL+SPACE** | Alternative talk button |
| **C** | Toggle continuous mode |
| **M** | Mute/unmute TTS |
| **V** | Adjust volume |
| **+/-** | Speech rate faster/slower |
| **H** | Show help |
| **Q** | Quit |
| **ESC** | Cancel current operation |

## Accessibility Features

### For Blind and Low-Vision Users

**Screen reader integration:**

```bash
# Enable screen reader mode
luminous-nix config set accessibility.screen_reader true

# Now all visual output also read aloud
```

**High-contrast mode:**

```bash
# Enable high contrast visual interface
luminous-nix config set accessibility.high_contrast true
```

**Verbose responses:**

```bash
# Get more detailed audio descriptions
luminous-nix config set voice.verbose true
```

### For Motor Disabilities

**Hands-free operation:**

```bash
# Continuous mode + wake word
luminous-nix voice --continuous --wake-word "hey nix"

# Now fully hands-free
```

**Extended timeout:**

```bash
# Give more time to respond to prompts
luminous-nix config set voice.response_timeout 30
# Default: 10 seconds
```

### For Hearing Disabilities

**Visual mode:**

```bash
# Disable TTS, show text responses only
luminous-nix voice --visual-only

# All responses shown as text
```

**Enhanced visual feedback:**

```bash
# Show waveforms and confirmation animations
luminous-nix config set voice.visual_feedback true
```

## Multi-Language Support

### Supported Languages

**Full support** (recognition + TTS):
- English (US, UK, AU)
- Spanish
- French
- German
- Italian

**Recognition only** (Whisper supports 90+ languages):
- Portuguese, Dutch, Polish, Russian, Japanese, Chinese, Korean, and more
- (TTS responses will be in English)

### Switching Languages

```bash
# Set recognition language
luminous-nix config set voice.language "es-ES"  # Spanish

# Set TTS language (if available)
luminous-nix config set voice.tts_language "es-ES"

# Example Spanish commands:
"Instala Firefox"
"Habilita Docker"
"Muéstrame el estado del sistema"
```

### Language-Specific Models

For better accuracy in non-English languages:

```bash
# Download language-specific model
luminous-nix voice --download-model es-ES

# ~1.5GB per language
```

## Troubleshooting

### "Microphone not detected"

**Check hardware:**
```bash
# List microphones
arecord -l

# Test recording
arecord -d 5 test.wav
aplay test.wav
```

**Set manually:**
```bash
luminous-nix config set voice.microphone "hw:1,0"
# Adjust numbers based on `arecord -l` output
```

**Permissions:**
```bash
# Add user to audio group
sudo usermod -a -G audio $USER
# Log out and back in
```

### "Recognition is inaccurate"

**Improve recognition:**

1. **Reduce background noise** - Find quieter environment
2. **Better microphone** - Headset mics often work better
3. **Adjust mic sensitivity:**
   ```bash
   alsamixer
   # Adjust capture level
   ```
4. **Use larger model** (slower but more accurate):
   ```bash
   luminous-nix config set voice.model "whisper-medium"
   # Options: tiny, base, small, medium, large
   # Default: small (good balance)
   ```

### "Voice is robotic/unclear"

**Improve TTS quality:**

```bash
# Use higher quality voice
luminous-nix config set voice.tts_voice "en_US-libritts-high"

# Adjust speech rate
luminous-nix config set voice.speech_rate 0.9

# Reduce speech rate can improve clarity
```

### "High CPU usage"

**Optimize performance:**

```bash
# Use smaller Whisper model
luminous-nix config set voice.model "whisper-tiny"
# Faster but slightly less accurate

# Disable continuous mode
# Use push-to-talk instead

# Close other applications while using voice
```

### "Slow response time"

**Speed up:**

```bash
# Use faster model
luminous-nix config set voice.model "whisper-tiny"

# Reduce TTS quality
luminous-nix config set voice.tts_voice "en_US-ryan-low"

# Disable verbose mode
luminous-nix config set voice.verbose false
```

## Configuration Reference

All voice settings in `~/.config/luminous-nix/config.yaml`:

```yaml
voice:
  # Speech recognition
  model: "whisper-small"  # tiny, base, small, medium, large
  language: "en-US"
  microphone: "default"

  # Text-to-speech
  tts_voice: "en_US-lessac-medium"
  speech_rate: 1.0  # 0.5-2.0
  volume: 0.8  # 0.0-1.0

  # Interaction
  activation_key: "space"
  continuous_mode: false
  wake_word: null  # or "hey nix"
  response_timeout: 10

  # Accessibility
  verbose: false
  visual_feedback: true
  screen_reader: false

  # Performance
  use_gpu: false  # Enable if you have CUDA GPU
  threads: 4  # CPU threads for recognition
```

## Privacy & Security

### All Processing is Local

**Your voice never leaves your machine:**

- Whisper runs locally (no cloud API)
- Piper TTS runs locally
- No recordings uploaded
- No voice data collected

**What's stored locally:**

- Voice models (in `~/.cache/luminous-nix/models/`)
- Configuration (in `~/.config/luminous-nix/`)
- Nothing else

**To verify:**

```bash
# Check network activity while using voice
# Should show no external connections
sudo tcpdump -i any port 443 &
luminous-nix voice
# [use voice commands]
# Stop tcpdump (Ctrl+C)
# Review: should show zero HTTPS traffic
```

### Disabling Voice

If you no longer want voice support:

```bash
# Remove voice models
luminous-nix voice --remove-models

# Disable voice features
luminous-nix config set voice.enabled false
```

## Best Practices

### When to Use Voice

**Great for:**

- ✅ Quick package installations
- ✅ System status checks
- ✅ Accessibility needs
- ✅ Hands-free operation (cooking, etc.)
- ✅ Learning NixOS concepts
- ✅ Simple configuration changes

**Less ideal for:**

- ❌ Complex multi-step operations
- ❌ Precise text editing
- ❌ Very noisy environments
- ❌ Reading long outputs

**Combine voice + keyboard** for best results.

### Voice + Text Workflow

Effective hybrid approach:

```bash
# Use voice for commands
[Voice] "Install Docker"
[Voice] "Show me the configuration"

# Use keyboard for edits
[Keyboard] Edit configuration file manually

# Use voice for application
[Voice] "Apply changes"
[Voice] "Show system status"
```

## Getting Help

**Voice-specific support:**

```bash
# Built-in help
luminous-nix voice --help

# In voice mode
[Voice] "Help"
[Voice] "How do I...?"
```

**Community:**

- [Discord #voice-interface](https://discord.gg/luminous)
- [GitHub Discussions: Voice](https://github.com/Luminous-Dynamics/luminous-nix/discussions?discussions_q=label%3Avoice)
- [FAQ](faq.md#voice-interface)

**Report issues:**

- [GitHub Issues](https://github.com/Luminous-Dynamics/luminous-nix/issues/new?labels=voice)
- Email: support@luminousdynamics.org

---

## Success Stories

> "The voice interface changed everything for me as a blind developer. I can now use NixOS independently." - Maya, Software Engineer

> "I use voice mode while cooking to check on long-running builds without stopping what I'm doing." - Chris, DevOps Engineer

> "As someone with RSI, reducing keyboard time is crucial. Voice control lets me keep using NixOS comfortably." - Jordan, Systems Administrator

---

## What's Next

**Planned improvements:**

- Better wake word accuracy
- More natural conversation (remember context)
- Custom commands and aliases
- Voice shortcuts
- Multi-user voice profiles
- Improved multilingual support

**Help us improve:**

- Report accuracy issues
- Share successful voice commands
- Suggest features
- Contribute improvements

---

*"Speak and be heard. Technology should be accessible to all."* 🎤💜

*Last updated: November 14, 2025*

[Back to Luminous Nix Docs](index.md) | [Report Voice Issues](https://github.com/Luminous-Dynamics/luminous-nix/issues/new?labels=voice)
