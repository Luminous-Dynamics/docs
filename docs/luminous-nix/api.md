# API Reference

Complete API reference for Luminous Nix Python library and command-line interface.

## Overview

Luminous Nix can be used as:

1. **Command-line tool** - `luminous-nix` CLI
2. **Python library** - Import and use in your own code
3. **NixOS module** - Declarative system integration

This reference documents all three interfaces.

## Command-Line Interface

### `luminous-nix`

Main command-line interface for natural language system management.

**Syntax:**
```bash
luminous-nix [OPTIONS] COMMAND [ARGS]
```

**Global Options:**

| Option | Description | Default |
|--------|-------------|---------|
| `--help, -h` | Show help message | - |
| `--version` | Show version | - |
| `--config PATH` | Path to config file | `~/.config/luminous-nix/config.yaml` |
| `--verbose, -v` | Verbose output | `False` |
| `--debug` | Debug mode | `False` |
| `--llm PROVIDER` | LLM provider (openai/ollama) | `ollama` |

### Commands

#### `ask`

Ask Luminous Nix to perform an action in natural language.

**Syntax:**
```bash
luminous-nix ask "NATURAL_LANGUAGE_REQUEST"
# or shorter:
ask-nix "NATURAL_LANGUAGE_REQUEST"
```

**Examples:**
```bash
ask-nix "install firefox"
ask-nix "enable docker and start the service"
ask-nix "what version of nixos am i running?"
```

**Options:**

| Option | Description |
|--------|-------------|
| `--yes, -y` | Skip confirmation prompts |
| `--dry-run` | Show what would be done without executing |
| `--explain` | Explain the planned actions |

#### `voice`

Start voice interface.

**Syntax:**
```bash
luminous-nix voice [OPTIONS]
```

**Options:**

| Option | Description | Default |
|--------|-------------|---------|
| `--continuous` | Continuous listening mode | `False` |
| `--wake-word WORD` | Wake word to activate | `None` |
| `--test-mic` | Test microphone | - |
| `--test-tts` | Test text-to-speech | - |
| `--list-voices` | List available TTS voices | - |

**Examples:**
```bash
# Start voice interface
luminous-nix voice

# Continuous mode with wake word
luminous-nix voice --continuous --wake-word "hey nix"

# Test microphone
luminous-nix voice --test-mic
```

#### `config`

Manage Luminous Nix configuration.

**Syntax:**
```bash
luminous-nix config SUBCOMMAND [ARGS]
```

**Subcommands:**

**`get`** - Get configuration value
```bash
luminous-nix config get KEY
# Example:
luminous-nix config get llm.provider
```

**`set`** - Set configuration value
```bash
luminous-nix config set KEY VALUE
# Example:
luminous-nix config set llm.provider openai
```

**`list`** - List all configuration
```bash
luminous-nix config list
```

**`reset`** - Reset to defaults
```bash
luminous-nix config reset
```

**`edit`** - Open config in editor
```bash
luminous-nix config edit
```

#### `setup`

Run initial setup wizard.

**Syntax:**
```bash
luminous-nix setup [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `--add-voice` | Add voice support |
| `--llm PROVIDER` | Set LLM provider |
| `--api-key KEY` | Set API key (for OpenAI) |

**Examples:**
```bash
# Run full setup
luminous-nix setup

# Add voice support to existing installation
luminous-nix setup --add-voice

# Configure for OpenAI
luminous-nix setup --llm openai --api-key sk-...
```

#### `daemon`

Run Luminous Nix as a background service.

**Syntax:**
```bash
luminous-nix daemon [OPTIONS]
```

**Options:**

| Option | Description | Default |
|--------|-------------|---------|
| `--port PORT` | HTTP API port | `8765` |
| `--host HOST` | Bind address | `127.0.0.1` |
| `--log-level LEVEL` | Logging level | `INFO` |

**Example:**
```bash
# Start daemon
luminous-nix daemon

# Custom port
luminous-nix daemon --port 9000
```

---

## Python Library API

### Installation

```bash
# Install via nix profile
nix profile install github:Luminous-Dynamics/luminous-nix

# Or in your flake.nix
{
  inputs.luminous-nix.url = "github:Luminous-Dynamics/luminous-nix";
}
```

### Core Module

#### `luminous_nix.ask()`

Process natural language request programmatically.

**Signature:**
```python
async def ask(
    query: str,
    *,
    auto_confirm: bool = False,
    dry_run: bool = False,
    context: Optional[dict] = None
) -> Result
```

**Parameters:**
- `query` (str): Natural language request
- `auto_confirm` (bool): Skip user confirmation
- `dry_run` (bool): Don't execute, just plan
- `context` (dict): Additional context for LLM

**Returns:** `Result` object with:
- `success` (bool): Whether request succeeded
- `intents` (List[Intent]): Parsed intents
- `actions_taken` (List[str]): Actions performed
- `output` (str): Human-readable result

**Example:**
```python
from luminous_nix import ask

async def main():
    result = await ask("install firefox")

    if result.success:
        print("✓", result.output)
    else:
        print("✗", result.error)

# Run with:
# python -m asyncio main.py
```

#### `luminous_nix.Parser`

Natural language parser class.

**Signature:**
```python
class Parser:
    def __init__(
        self,
        llm_client: Optional[LLMClient] = None,
        config: Optional[Config] = None
    )

    async def parse(
        self,
        user_input: str,
        context: Optional[dict] = None
    ) -> List[Intent]
```

**Example:**
```python
from luminous_nix import Parser
from luminous_nix.llm import OllamaClient

# Initialize
llm = OllamaClient(model="llama2")
parser = Parser(llm_client=llm)

# Parse request
intents = await parser.parse("install vim and enable ssh")

for intent in intents:
    print(f"{intent.action}: {intent.target}")
# Output:
# install: vim
# enable: sshd
```

#### `luminous_nix.Executor`

Execute parsed intents.

**Signature:**
```python
class Executor:
    def __init__(self, config: Optional[Config] = None)

    async def execute(
        self,
        intents: List[Intent],
        *,
        confirm: bool = True
    ) -> ExecutionResult
```

**Example:**
```python
from luminous_nix import Parser, Executor

parser = Parser()
executor = Executor()

# Parse and execute
intents = await parser.parse("install hello")
result = await executor.execute(intents)

print(result.success)  # True
print(result.output)   # "Successfully installed hello"
```

### Voice Module

#### `luminous_nix.voice.VoiceInterface`

Voice interface class.

**Signature:**
```python
class VoiceInterface:
    def __init__(
        self,
        *,
        wake_word: Optional[str] = None,
        continuous: bool = False,
        voice_config: Optional[VoiceConfig] = None
    )

    async def start(self) -> None
    async def stop(self) -> None
    async def listen_once(self) -> str
```

**Example:**
```python
from luminous_nix.voice import VoiceInterface

# Create interface
voice = VoiceInterface(wake_word="hey nix")

# Start listening
await voice.start()

# Listen for single command
command = await voice.listen_once()
print(f"Heard: {command}")

# Stop
await voice.stop()
```

### Configuration Module

#### `luminous_nix.config.Config`

Configuration management.

**Signature:**
```python
class Config:
    @classmethod
    def load(cls, path: Optional[Path] = None) -> Config

    def get(self, key: str, default: Any = None) -> Any
    def set(self, key: str, value: Any) -> None
    def save(self) -> None
```

**Example:**
```python
from luminous_nix.config import Config

# Load config
config = Config.load()

# Get values
llm_provider = config.get("llm.provider")  # "ollama"
api_key = config.get("llm.api_key")        # None

# Set values
config.set("llm.provider", "openai")
config.set("llm.api_key", "sk-...")
config.save()
```

### LLM Module

#### `luminous_nix.llm.LLMClient`

Base class for LLM clients.

**Signature:**
```python
class LLMClient(ABC):
    @abstractmethod
    async def complete(
        self,
        prompt: str,
        *,
        temperature: float = 0.7,
        max_tokens: int = 1000
    ) -> str
```

#### `luminous_nix.llm.OllamaClient`

Ollama client implementation.

**Example:**
```python
from luminous_nix.llm import OllamaClient

client = OllamaClient(
    model="llama2",
    base_url="http://localhost:11434"
)

response = await client.complete("Install Firefox")
print(response)
```

#### `luminous_nix.llm.OpenAIClient`

OpenAI client implementation.

**Example:**
```python
from luminous_nix.llm import OpenAIClient

client = OpenAIClient(
    api_key="sk-...",
    model="gpt-4"
)

response = await client.complete("Install Firefox")
print(response)
```

### Data Types

#### `Intent`

Structured representation of user intent.

```python
@dataclass
class Intent:
    action: str              # install, remove, enable, disable, etc.
    target: str              # package name, service name, etc.
    parameters: dict         # Additional parameters
    confidence: float        # LLM confidence (0-1)
    explanation: Optional[str] = None
```

#### `Result`

Result of executing a request.

```python
@dataclass
class Result:
    success: bool
    intents: List[Intent]
    actions_taken: List[str]
    output: str
    error: Optional[str] = None
```

---

## NixOS Module API

### Module Options

Include in your NixOS configuration:

```nix
{ config, pkgs, ... }:

{
  services.luminous-nix = {
    enable = true;

    # LLM Configuration
    llmProvider = "ollama";  # or "openai"
    ollamaUrl = "http://localhost:11434";

    # OpenAI (if using)
    openai = {
      apiKeyFile = "/run/secrets/openai-key";
      model = "gpt-4";
    };

    # Voice Configuration
    voice = {
      enable = true;
      wakeWord = "hey nix";
      ttsVoice = "en_US-lessac-medium";
    };

    # Safety Settings
    safety = {
      requireConfirmation = true;
      allowedActions = [ "install" "remove" "enable" "disable" ];
      blockedPatterns = [ "rm -rf /" ];
    };

    # HTTP API
    api = {
      enable = true;
      port = 8765;
      host = "127.0.0.1";
    };
  };
}
```

### Full Options Reference

#### `services.luminous-nix.enable`

**Type:** `bool`
**Default:** `false`
**Description:** Enable Luminous Nix service

#### `services.luminous-nix.llmProvider`

**Type:** `enum ["openai" "ollama"]`
**Default:** `"ollama"`
**Description:** LLM provider to use

#### `services.luminous-nix.ollamaUrl`

**Type:** `str`
**Default:** `"http://localhost:11434"`
**Description:** Ollama server URL

#### `services.luminous-nix.openai.apiKeyFile`

**Type:** `nullOr path`
**Default:** `null`
**Description:** Path to file containing OpenAI API key

#### `services.luminous-nix.voice.enable`

**Type:** `bool`
**Default:** `false`
**Description:** Enable voice interface

#### `services.luminous-nix.voice.wakeWord`

**Type:** `nullOr str`
**Default:** `null`
**Description:** Wake word for activation (e.g., "hey nix")

---

## HTTP API (Daemon Mode)

When running in daemon mode, Luminous Nix exposes an HTTP API.

### Base URL

```
http://localhost:8765/api/v1
```

### Authentication

Currently no authentication (local-only). Future versions will support API keys.

### Endpoints

#### `POST /ask`

Process natural language request.

**Request:**
```json
{
  "query": "install firefox",
  "auto_confirm": false,
  "dry_run": false
}
```

**Response:**
```json
{
  "success": true,
  "intents": [
    {
      "action": "install",
      "target": "firefox",
      "parameters": {},
      "confidence": 0.95
    }
  ],
  "actions_taken": [
    "Installed firefox"
  ],
  "output": "Successfully installed firefox"
}
```

#### `GET /status`

Get daemon status.

**Response:**
```json
{
  "status": "running",
  "version": "1.0.0",
  "llm_provider": "ollama",
  "voice_enabled": true
}
```

#### `POST /voice/listen`

Trigger single voice listening session.

**Request:**
```json
{
  "timeout": 30
}
```

**Response:**
```json
{
  "heard": "install firefox",
  "confidence": 0.92
}
```

---

## Plugin API

### Creating Plugins

**Example plugin structure:**

```python
# my_plugin/plugin.py
from luminous_nix.plugins import Plugin, register_plugin

@register_plugin
class MyPlugin(Plugin):
    name = "my-plugin"
    version = "1.0.0"

    def on_load(self):
        """Called when plugin loads"""
        pass

    def register_intents(self) -> dict:
        """Register custom intent handlers"""
        return {
            "my_action": self.handle_my_action
        }

    async def handle_my_action(self, intent: Intent) -> dict:
        """Handle custom action"""
        return {
            "success": True,
            "output": "My custom action completed"
        }
```

**Plugin registration:**

```python
# In your setup.py or pyproject.toml
[tool.poetry.plugins."luminous_nix.plugins"]
my_plugin = "my_plugin.plugin:MyPlugin"
```

---

## Error Handling

### Exceptions

#### `LuminousNixError`

Base exception for all Luminous Nix errors.

```python
class LuminousNixError(Exception):
    """Base exception"""
    pass
```

#### `ParseError`

Failed to parse user input.

```python
try:
    result = await ask("asdfqwer")
except ParseError as e:
    print(f"Could not understand: {e}")
```

#### `ExecutionError`

Failed to execute command.

```python
try:
    result = await ask("install nonexistent-package")
except ExecutionError as e:
    print(f"Execution failed: {e}")
```

#### `SafetyError`

Command blocked by safety checks.

```python
try:
    result = await ask("delete all my files")
except SafetyError as e:
    print(f"Blocked for safety: {e}")
```

---

## Examples

### Complete Example: Custom AI Assistant

```python
#!/usr/bin/env python3
"""
Custom system management assistant using Luminous Nix
"""

import asyncio
from luminous_nix import Parser, Executor, Config
from luminous_nix.llm import OllamaClient

async def main():
    # Setup
    config = Config.load()
    llm = OllamaClient(model="llama2")
    parser = Parser(llm_client=llm)
    executor = Executor(config=config)

    print("🤖 System Management Assistant")
    print("Type 'exit' to quit\n")

    while True:
        # Get user input
        user_input = input("You: ").strip()

        if user_input.lower() in ["exit", "quit"]:
            break

        try:
            # Parse request
            intents = await parser.parse(user_input)

            if not intents:
                print("Assistant: I didn't understand that. Can you rephrase?")
                continue

            # Show plan
            print("\nAssistant: I'll do the following:")
            for intent in intents:
                print(f"  - {intent.action} {intent.target}")

            # Confirm
            confirm = input("\nProceed? (y/n): ")
            if confirm.lower() != 'y':
                print("Assistant: Cancelled.")
                continue

            # Execute
            result = await executor.execute(intents, confirm=False)

            if result.success:
                print(f"\n✓ {result.output}")
            else:
                print(f"\n✗ Error: {result.error}")

        except Exception as e:
            print(f"\n✗ Error: {e}")

if __name__ == "__main__":
    asyncio.run(main())
```

---

## Version History

### v1.0.0 (Current)

- Initial stable release
- Natural language processing
- Voice interface
- NixOS module
- HTTP API daemon mode

### Upcoming (v1.1.0)

- GraphQL API
- Plugin marketplace
- Multi-user support
- Enhanced voice recognition

---

## Getting Help

**API Questions:**

- 💬 [GitHub Discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- 📧 dev@luminousdynamics.org
- 📖 [User Guide](user-guide.md)
- 📖 [Development Guide](development.md)

**Report API Bugs:**

- [GitHub Issues](https://github.com/Luminous-Dynamics/luminous-nix/issues)

---

*\"Simple, powerful APIs that respect your intelligence.\"* 💜

*Last updated: November 15, 2025*

[Back to Luminous Nix Docs](index.md) | [View Source](https://github.com/Luminous-Dynamics/luminous-nix)
