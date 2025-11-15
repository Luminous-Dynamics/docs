# Development Guide

Contribute to Luminous Nix and help build consciousness-first natural language system management.

## Overview

Luminous Nix is **open source** (MIT License) and welcomes contributions from developers of all skill levels.

**Tech stack:**

- **Language:** Python 3.11+
- **AI/ML:** OpenAI API (configurable), local LLMs via Ollama
- **Voice:** OpenAI Whisper, Piper TTS
- **NixOS:** Nix flakes, NixOS modules
- **Testing:** pytest, hypothesis (property testing)
- **CI/CD:** GitHub Actions with NixOS runners

**Repository:** [github.com/Luminous-Dynamics/luminous-nix](https://github.com/Luminous-Dynamics/luminous-nix)

## Getting Started

### Prerequisites

**Required:**
- NixOS 23.05+ (or Nix package manager on Linux/macOS)
- Git
- GitHub account (for contributing)

**Recommended:**
- Familiarity with Python
- Basic understanding of NixOS
- Experience with natural language processing (helpful but not required)

### Development Environment Setup

**1. Fork and clone:**

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR-USERNAME/luminous-nix.git
cd luminous-nix
```

**2. Enter development environment:**

```bash
# Nix flakes automatically set up complete dev environment
nix develop

# This gives you:
# - Python 3.11 with all dependencies
# - Testing tools (pytest, black, mypy, ruff)
# - Pre-commit hooks
# - Development utilities
```

**3. Install pre-commit hooks:**

```bash
# Automatically format and check code before commits
pre-commit install

# Manually run checks:
pre-commit run --all-files
```

**4. Run tests:**

```bash
# Run full test suite
pytest

# Run with coverage
pytest --cov=luminous_nix --cov-report=html

# Run specific test file
pytest tests/test_parser.py

# Run tests matching pattern
pytest -k "test_install"
```

**5. Build the package:**

```bash
# Build Luminous Nix package
nix build

# Result in ./result/bin/luminous-nix
./result/bin/luminous-nix --version
```

## Project Structure

```
luminous-nix/
├── flake.nix                 # Nix flake definition
├── flake.lock               # Locked dependencies
├── pyproject.toml           # Python project metadata
├── README.md
│
├── luminous_nix/            # Main package
│   ├── __init__.py
│   ├── main.py              # CLI entry point
│   │
│   ├── core/                # Core functionality
│   │   ├── parser.py        # Natural language parser
│   │   ├── executor.py      # Command executor
│   │   ├── safety.py        # Safety checks
│   │   └── context.py       # Context management
│   │
│   ├── llm/                 # LLM integration
│   │   ├── openai_client.py # OpenAI integration
│   │   ├── ollama_client.py # Local LLM integration
│   │   ├── prompt.py        # Prompt templates
│   │   └── completion.py    # Completion logic
│   │
│   ├── voice/               # Voice interface
│   │   ├── recognition.py   # Speech-to-text (Whisper)
│   │   ├── synthesis.py     # Text-to-speech (Piper)
│   │   └── interface.py     # Voice UI
│   │
│   ├── nix/                 # NixOS integration
│   │   ├── flakes.py        # Nix flakes support
│   │   ├── derivations.py   # Package derivations
│   │   ├── config.py        # NixOS configuration
│   │   └── generations.py   # System generations
│   │
│   └── utils/               # Utilities
│       ├── config.py        # Configuration management
│       ├── logging.py       # Logging setup
│       └── validation.py    # Input validation
│
├── nixos/                   # NixOS module
│   └── module.nix           # NixOS service module
│
├── tests/                   # Test suite
│   ├── unit/                # Unit tests
│   │   ├── test_parser.py
│   │   ├── test_executor.py
│   │   └── test_safety.py
│   │
│   ├── integration/         # Integration tests
│   │   ├── test_install.py
│   │   ├── test_config.py
│   │   └── test_voice.py
│   │
│   └── fixtures/            # Test fixtures
│       └── sample_inputs.py
│
├── docs/                    # Documentation source
│   └── ...
│
└── scripts/                 # Development scripts
    ├── setup-dev.sh
    ├── run-tests.sh
    └── build-docs.sh
```

## Core Architecture

### Natural Language Processing Flow

```
User Input: "Install Firefox and enable Docker"
    ↓
┌───────────────────────┐
│  1. Input Validation  │ ← Check for malicious input
└───────────┬───────────┘
            ↓
┌───────────────────────┐
│  2. LLM Processing    │ ← Parse intent with Claude/GPT/Ollama
└───────────┬───────────┘
            ↓
┌───────────────────────┐
│  3. Intent Extraction │ ← Extract structured actions
└───────────┬───────────┘
            ↓
      [Install Firefox]
      [Enable Docker]
            ↓
┌───────────────────────┐
│  4. Safety Checks     │ ← Verify safe to execute
└───────────┬───────────┘
            ↓
┌───────────────────────┐
│  5. User Confirmation │ ← Get approval for changes
└───────────┬───────────┘
            ↓
┌───────────────────────┐
│  6. Nix Execution     │ ← Run nix commands
└───────────┬───────────┘
            ↓
┌───────────────────────┐
│  7. Result Reporting  │ ← Report success/failure
└───────────────────────┘
```

### Key Components

#### 1. Parser (`core/parser.py`)

**Responsibility:** Convert natural language to structured commands

```python
# luminous_nix/core/parser.py
from dataclasses import dataclass
from typing import List, Optional

@dataclass
class Intent:
    """Structured representation of user intent"""
    action: str  # install, remove, enable, disable, etc.
    target: str  # package name, service name, etc.
    parameters: dict  # Additional parameters
    confidence: float  # LLM confidence (0-1)

class Parser:
    """Parse natural language into structured intents"""

    def __init__(self, llm_client):
        self.llm = llm_client

    async def parse(self, user_input: str, context: dict) -> List[Intent]:
        """
        Parse user input into structured intents

        Args:
            user_input: Natural language input
            context: System context (current packages, config, etc.)

        Returns:
            List of Intent objects
        """
        # Build prompt with context
        prompt = self._build_prompt(user_input, context)

        # Get LLM completion
        response = await self.llm.complete(prompt)

        # Parse structured response
        intents = self._parse_response(response)

        return intents

    def _build_prompt(self, user_input: str, context: dict) -> str:
        """Build prompt for LLM"""
        return f"""
You are Luminous Nix, a natural language interface for NixOS.
Parse the user's request into structured actions.

Current system state:
- Installed packages: {context.get('packages', [])}
- Enabled services: {context.get('services', [])}
- NixOS version: {context.get('version', 'unknown')}

User request: {user_input}

Return JSON array of intents with format:
[
  {{
    "action": "install",
    "target": "firefox",
    "parameters": {{}},
    "confidence": 0.95
  }}
]
"""
```

#### 2. Safety Checker (`core/safety.py`)

**Responsibility:** Validate commands are safe to execute

```python
# luminous_nix/core/safety.py
from typing import List, Tuple
from .parser import Intent

class SafetyChecker:
    """Validate intents are safe to execute"""

    # Dangerous patterns to block
    BLOCKED_PATTERNS = [
        r"rm\s+-rf\s+/",           # Deleting root
        r"dd\s+if=.*of=/dev/sd",   # Disk operations
        r"mkfs\.",                  # Filesystem creation
        r"curl.*\|\s*sh",           # Pipe to shell
    ]

    # Actions requiring confirmation
    REQUIRES_CONFIRMATION = [
        "remove",      # Removing packages
        "disable",     # Disabling services
        "rebuild",     # System rebuild
    ]

    def check(self, intents: List[Intent]) -> Tuple[bool, List[str]]:
        """
        Check if intents are safe to execute

        Returns:
            (is_safe, list_of_warnings)
        """
        warnings = []

        for intent in intents:
            # Check for blocked patterns
            if self._is_blocked(intent):
                return False, [f"Blocked: {intent.action} {intent.target}"]

            # Check for dangerous operations
            if self._is_dangerous(intent):
                warnings.append(
                    f"Warning: {intent.action} {intent.target} "
                    f"is potentially dangerous"
                )

        return True, warnings

    def _is_blocked(self, intent: Intent) -> bool:
        """Check if intent matches blocked patterns"""
        # Implementation
        pass

    def _is_dangerous(self, intent: Intent) -> bool:
        """Check if intent is dangerous"""
        return intent.action in self.REQUIRES_CONFIRMATION
```

#### 3. Executor (`core/executor.py`)

**Responsibility:** Execute validated intents via Nix

```python
# luminous_nix/core/executor.py
import asyncio
from typing import List
from .parser import Intent

class Executor:
    """Execute validated intents"""

    async def execute(self, intents: List[Intent]) -> dict:
        """
        Execute list of intents

        Returns:
            Execution results with status and output
        """
        results = []

        for intent in intents:
            result = await self._execute_intent(intent)
            results.append(result)

            # Stop on first failure
            if not result["success"]:
                break

        return {
            "success": all(r["success"] for r in results),
            "results": results
        }

    async def _execute_intent(self, intent: Intent) -> dict:
        """Execute a single intent"""
        handler = self._get_handler(intent.action)

        if not handler:
            return {
                "success": False,
                "error": f"Unknown action: {intent.action}"
            }

        try:
            output = await handler(intent)
            return {
                "success": True,
                "intent": intent,
                "output": output
            }
        except Exception as e:
            return {
                "success": False,
                "intent": intent,
                "error": str(e)
            }

    def _get_handler(self, action: str):
        """Get handler function for action"""
        handlers = {
            "install": self._handle_install,
            "remove": self._handle_remove,
            "enable": self._handle_enable,
            "disable": self._handle_disable,
        }
        return handlers.get(action)

    async def _handle_install(self, intent: Intent) -> str:
        """Handle package installation"""
        package = intent.target

        # Search for package
        proc = await asyncio.create_subprocess_shell(
            f"nix search nixpkgs#{package} --json",
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE
        )
        stdout, stderr = await proc.communicate()

        if proc.returncode != 0:
            raise Exception(f"Package not found: {package}")

        # Install via nix profile
        proc = await asyncio.create_subprocess_shell(
            f"nix profile install nixpkgs#{package}",
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE
        )
        stdout, stderr = await proc.communicate()

        if proc.returncode != 0:
            raise Exception(stderr.decode())

        return f"Successfully installed {package}"
```

## Development Workflow

### Making Changes

**1. Create a branch:**

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

**2. Make your changes:**

Follow the code style guide (below) and add tests for new functionality.

**3. Run tests:**

```bash
# Full test suite
pytest

# Specific tests
pytest tests/unit/test_parser.py -v

# With coverage
pytest --cov=luminous_nix
```

**4. Format code:**

```bash
# Auto-format with black
black luminous_nix/ tests/

# Sort imports
ruff check --select I --fix luminous_nix/ tests/

# Type checking
mypy luminous_nix/
```

**5. Commit:**

```bash
# Pre-commit hooks will run automatically
git add .
git commit -m "feat: Add support for custom LLM providers"
```

**Commit message format (Conventional Commits):**

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `test`: Adding or updating tests
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `chore`: Build process or auxiliary tool changes

**Examples:**
```
feat(voice): Add support for custom wake words
fix(parser): Handle multi-line user input correctly
docs: Update installation instructions for Flakes
test(safety): Add tests for dangerous command detection
```

**6. Push and create PR:**

```bash
git push origin feature/your-feature-name

# Create pull request on GitHub
# Include:
# - Description of changes
# - Related issue number (if applicable)
# - Screenshots (for UI changes)
# - Test results
```

### Code Style Guide

**Python:**

We follow **PEP 8** with some modifications:

```python
# Line length: 100 characters (not 79)
# Use black for formatting (automatically applied by pre-commit)

# Good: Clear, descriptive names
def parse_natural_language_input(user_input: str) -> List[Intent]:
    """Parse natural language into structured intents"""
    pass

# Bad: Abbreviations, unclear names
def parse_nl(inp: str) -> list:
    pass

# Good: Type hints everywhere
async def execute_intent(
    intent: Intent,
    context: SystemContext
) -> ExecutionResult:
    pass

# Good: Docstrings for public APIs
def install_package(package_name: str, version: Optional[str] = None) -> bool:
    """
    Install a package via Nix profile

    Args:
        package_name: Name of package to install
        version: Optional specific version

    Returns:
        True if installation succeeded

    Raises:
        PackageNotFoundError: If package doesn't exist
        InstallationError: If installation fails
    """
    pass
```

**Nix:**

```nix
# Use descriptive attribute names
{ config, lib, pkgs, ... }:

let
  cfg = config.services.luminous-nix;
in {
  # Good: Clear option descriptions
  options.services.luminous-nix = {
    enable = lib.mkEnableOption "Luminous Nix natural language interface";

    llmProvider = lib.mkOption {
      type = lib.types.enum [ "openai" "ollama" ];
      default = "ollama";
      description = ''
        LLM provider to use for natural language processing.
        - openai: Use OpenAI API (requires API key)
        - ollama: Use local Ollama server
      '';
    };
  };

  # Format with nixpkgs-fmt
}
```

### Testing Guidelines

**Test structure:**

```python
# tests/unit/test_parser.py
import pytest
from luminous_nix.core.parser import Parser, Intent

class TestParser:
    """Tests for natural language parser"""

    @pytest.fixture
    def parser(self, mock_llm):
        """Create parser with mock LLM"""
        return Parser(llm_client=mock_llm)

    @pytest.mark.asyncio
    async def test_parse_install_intent(self, parser):
        """Test parsing simple install command"""
        result = await parser.parse("install firefox", context={})

        assert len(result) == 1
        assert result[0].action == "install"
        assert result[0].target == "firefox"
        assert result[0].confidence > 0.8

    @pytest.mark.asyncio
    async def test_parse_multiple_intents(self, parser):
        """Test parsing command with multiple intents"""
        result = await parser.parse(
            "install firefox and enable docker",
            context={}
        )

        assert len(result) == 2
        assert result[0].action == "install"
        assert result[1].action == "enable"

    @pytest.mark.asyncio
    async def test_parse_ambiguous_input(self, parser):
        """Test handling of ambiguous input"""
        result = await parser.parse("make my computer better", context={})

        # Should ask for clarification
        assert result[0].action == "clarify"
```

**Property-based testing:**

```python
# Use Hypothesis for property-based tests
from hypothesis import given, strategies as st

@given(st.text(min_size=1, max_size=1000))
def test_parser_never_crashes(user_input):
    """Parser should never crash on any input"""
    parser = Parser(llm_client=mock_llm)

    try:
        result = parser.parse(user_input, context={})
        # Should always return list (might be empty)
        assert isinstance(result, list)
    except Exception as e:
        pytest.fail(f"Parser crashed on input: {user_input}, error: {e}")
```

**Integration tests:**

```python
# tests/integration/test_install.py
import pytest
import subprocess

@pytest.mark.integration
@pytest.mark.slow
def test_install_package_e2e():
    """Test complete package installation flow"""

    # Run luminous-nix command
    result = subprocess.run(
        ["luminous-nix", "install", "hello"],
        capture_output=True,
        text=True
    )

    assert result.returncode == 0
    assert "Successfully installed hello" in result.stdout

    # Verify package is available
    result = subprocess.run(["which", "hello"], capture_output=True)
    assert result.returncode == 0

    # Clean up
    subprocess.run(["nix", "profile", "remove", "hello"])
```

**Test coverage:**

We aim for **80%+ code coverage**:

```bash
# Generate coverage report
pytest --cov=luminous_nix --cov-report=html --cov-report=term

# View in browser
firefox htmlcov/index.html
```

## Building and Packaging

### Building with Nix

```bash
# Build the package
nix build

# Build and run
nix run

# Build specific output
nix build .#luminous-nix
nix build .#luminous-nix-docs

# Build for different systems
nix build .#packages.x86_64-linux.luminous-nix
nix build .#packages.aarch64-darwin.luminous-nix
```

### NixOS Module Development

```nix
# nixos/module.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.luminous-nix;
  luminous-nix = pkgs.luminous-nix or (import ../. { inherit pkgs; });
in {
  options.services.luminous-nix = {
    enable = mkEnableOption "Luminous Nix service";

    llmProvider = mkOption {
      type = types.enum [ "openai" "ollama" ];
      default = "ollama";
      description = "LLM provider to use";
    };

    apiKeyFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Path to file containing API key";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ luminous-nix ];

    # Create service user
    users.users.luminous-nix = {
      isSystemUser = true;
      group = "luminous-nix";
      description = "Luminous Nix service user";
    };

    users.groups.luminous-nix = {};

    # Systemd service
    systemd.services.luminous-nix = {
      description = "Luminous Nix Assistant";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        Type = "simple";
        User = "luminous-nix";
        Group = "luminous-nix";
        ExecStart = "${luminous-nix}/bin/luminous-nix daemon";
        Restart = "on-failure";
      };

      environment = {
        LLM_PROVIDER = cfg.llmProvider;
      };
    };
  };
}
```

## Plugin Development

### Creating a Plugin

Luminous Nix supports plugins for extending functionality:

```python
# my_plugin/plugin.py
from luminous_nix.plugins import Plugin, register_plugin

@register_plugin
class MyCustomPlugin(Plugin):
    """Custom plugin for Luminous Nix"""

    name = "my-custom-plugin"
    version = "1.0.0"

    def on_load(self):
        """Called when plugin is loaded"""
        print(f"Loading {self.name}...")

    def register_intents(self):
        """Register custom intent handlers"""
        return {
            "custom_action": self.handle_custom_action
        }

    async def handle_custom_action(self, intent):
        """Handle custom action"""
        # Your logic here
        return {"success": True, "message": "Custom action completed"}

    def register_commands(self):
        """Register custom CLI commands"""
        return {
            "my-command": self.my_command
        }

    def my_command(self, args):
        """Custom CLI command"""
        print("Running my custom command!")
```

**Installing plugin:**

```bash
# Install via pip
pip install luminous-nix-my-plugin

# Or add to flake.nix
```

## Common Development Tasks

### Adding a New Intent Handler

```python
# 1. Define intent in parser.py
INTENT_SCHEMAS = {
    "update_system": {
        "action": "update",
        "target": "system",
        "parameters": {"channel": str}
    }
}

# 2. Add handler in executor.py
async def _handle_update(self, intent: Intent) -> str:
    """Handle system updates"""
    channel = intent.parameters.get("channel", "nixos-23.11")

    proc = await asyncio.create_subprocess_shell(
        f"sudo nix-channel --update",
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE
    )
    stdout, stderr = await proc.communicate()

    if proc.returncode != 0:
        raise Exception(stderr.decode())

    return "System updated successfully"

# 3. Register handler
def _get_handler(self, action: str):
    handlers = {
        # ... existing handlers
        "update": self._handle_update,
    }
    return handlers.get(action)

# 4. Add tests
@pytest.mark.asyncio
async def test_handle_update(executor):
    intent = Intent(action="update", target="system", parameters={})
    result = await executor.execute([intent])
    assert result["success"]
```

### Adding Voice Commands

```python
# luminous_nix/voice/custom_commands.py

VOICE_SHORTCUTS = {
    # Map common phrases to intents
    "update everything": Intent(
        action="update",
        target="system",
        parameters={},
        confidence=1.0
    ),

    "show me what's installed": Intent(
        action="list",
        target="packages",
        parameters={},
        confidence=1.0
    ),
}
```

### Improving LLM Prompts

```python
# luminous_nix/llm/prompt.py

SYSTEM_PROMPT = """
You are Luminous Nix, a natural language interface for NixOS.

Your role:
1. Parse user requests into structured actions
2. Explain NixOS concepts clearly
3. Suggest safe alternatives to dangerous operations
4. Always prioritize user safety and data integrity

Available actions:
- install: Install packages
- remove: Remove packages
- enable: Enable services
- disable: Disable services
- search: Search for packages
- list: List installed packages/enabled services

Response format: JSON array of intents
"""

# Update prompts to improve accuracy, safety, or user experience
```

## Contributing Guidelines

### Before Submitting PR

**Checklist:**

- [ ] Tests pass (`pytest`)
- [ ] Code formatted (`black`, `ruff`)
- [ ] Type checks pass (`mypy`)
- [ ] Documentation updated (if adding features)
- [ ] CHANGELOG.md updated
- [ ] Commit messages follow Conventional Commits
- [ ] PR description explains changes clearly

### PR Review Process

1. **Automated checks** run (tests, formatting, type checking)
2. **Code review** by maintainer(s)
3. **Discussion** and requested changes
4. **Approval** and merge

**Response time:** We aim to respond to PRs within 48 hours.

### Getting Help

**Development questions:**

- 💬 [Discord #development](https://discord.gg/luminous)
- 💬 [GitHub Discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- 📧 dev@luminousdynamics.org

**Pair programming:**

We offer **pair programming sessions** for new contributors:
- Book via [calendly.com/luminous-dynamics/pairing](https://calendly.com/luminous-dynamics/pairing)
- 1-hour sessions, video call
- Work on issue together, learn the codebase

## Release Process

**Versioning:** We follow **Semantic Versioning** (semver.org)

- **Major** (1.0.0): Breaking changes
- **Minor** (0.1.0): New features, backwards compatible
- **Patch** (0.0.1): Bug fixes, backwards compatible

**Release workflow:**

1. Update version in `pyproject.toml` and `flake.nix`
2. Update `CHANGELOG.md`
3. Create git tag: `git tag v1.2.3`
4. Push tag: `git push origin v1.2.3`
5. GitHub Actions automatically:
   - Runs full test suite
   - Builds packages for multiple platforms
   - Publishes to PyPI
   - Updates flake in nixpkgs
   - Creates GitHub release with notes

---

## Development Philosophy

### Consciousness-First Development

Apply our values to development:

**1. Respect Developer Attention**
- Clear, focused documentation
- Helpful error messages
- Minimal cognitive load

**2. Amplify Developer Capability**
- Good tooling (nix develop, pre-commit, tests)
- Pair programming for onboarding
- Learning resources

**3. Maintain Transparency**
- Clear architecture
- Well-commented code
- Public roadmap

**4. Enable Developer Sovereignty**
- Open source, MIT license
- Documented APIs
- Plugin system

**5. Serve Developer Wellbeing**
- Respectful code reviews
- No crunch time
- Celebrate contributions

### Code Review Culture

**When reviewing:**

✅ **Do:**
- Ask questions to understand
- Suggest improvements kindly
- Praise good work
- Focus on the code, not the person
- Provide actionable feedback

❌ **Don't:**
- Demand perfection
- Use "just" or "simply"
- Make it personal
- Block on style preferences
- Bike-shed

**Example good review comment:**

> This is a great start on the voice recognition feature! I have a couple of suggestions:
>
> 1. Could we add error handling for when the microphone is unavailable? This would help users on systems without audio input.
> 2. The `process_audio()` function is getting complex. Consider extracting the preprocessing logic into a separate function for clarity.
>
> Nice work on the comprehensive tests! 🎉

---

## Resources

**Learning NixOS:**
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Nix Pills](https://nixos.org/guides/nix-pills/)
- [Flakes Documentation](https://nixos.wiki/wiki/Flakes)

**Python Development:**
- [Real Python](https://realpython.com/)
- [Python Type Hints](https://mypy.readthedocs.io/)
- [pytest Documentation](https://docs.pytest.org/)

**AI/LLM Development:**
- [OpenAI API Docs](https://platform.openai.com/docs)
- [Anthropic Claude Docs](https://docs.anthropic.com/)
- [LangChain](https://python.langchain.com/)

**Our community:**
- [GitHub Discussions](https://github.com/Luminous-Dynamics/luminous-nix/discussions)
- [Discord](https://discord.gg/luminous)
- [Contributing Guide](https://github.com/Luminous-Dynamics/luminous-nix/blob/main/CONTRIBUTING.md)

---

*\"Code is written once and read many times. Write it with love for the next person (often yourself).\"* 💜

*Last updated: November 15, 2025*

[Back to Luminous Nix Docs](index.md) | [View Source Code](https://github.com/Luminous-Dynamics/luminous-nix)
