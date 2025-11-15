# Glossary

Definitions of technical terms used in Luminous Dynamics documentation.

## How to Use

- **Click a letter** to jump to that section
- **Use Ctrl/Cmd+F** to search for specific terms
- **See also links** connect related concepts

[A](#a) | [B](#b) | [C](#c) | [D](#d) | [E](#e) | [F](#f) | [G](#g) | [H](#h) | [I](#i) | [J](#j) | [K](#k) | [L](#l) | [M](#m) | [N](#n) | [O](#o) | [P](#p) | [Q](#q) | [R](#r) | [S](#s) | [T](#t) | [U](#u) | [V](#v) | [W](#w) | [X](#x) | [Y](#y) | [Z](#z)

---

## A {#a}

### AI (Artificial Intelligence)
Computer systems that perform tasks normally requiring human intelligence, such as understanding language, recognizing patterns, and making decisions.

**In Luminous Dynamics:**
- Used in Luminous Nix for natural language processing
- Claude AI for development (Sacred Trinity)
- Local LLMs for privacy-preserving operations

*See also: [LLM](#llm), [Natural Language Processing](#natural-language-processing)*

### API (Application Programming Interface)
Set of rules and protocols allowing different software applications to communicate with each other.

**In Luminous Dynamics:**
- Terra Lumina REST API for accessing investment platform
- Luminous Nix Python library API
- HTTP daemon API for background services

*See also: [REST API](#rest-api), [SDK](#sdk)*

### API Key
Authentication credential used to access API services securely.

**Example:**
```
export OPENAI_API_KEY="sk-abc123..."
```

*See also: [Authentication](#authentication), [OAuth](#oauth)*

---

## B {#b}

### Blockchain
Distributed ledger technology that records transactions across multiple computers, ensuring transparency and immutability.

**In Terra Lumina:**
- Ownership tokens minted on Polygon blockchain
- Immutable record of investments
- Transparent tracking of asset ownership

*See also: [Smart Contract](#smart-contract), [Polygon](#polygon)*

### Backend
Server-side part of an application that handles business logic, database operations, and API requests.

**Terra Lumina backend:**
- Python/FastAPI
- PostgreSQL database
- Blockchain integration
- Payment processing

*See also: [Frontend](#frontend), [Microservices](#microservices)*

---

## C {#c}

### CLI (Command-Line Interface)
Text-based interface for interacting with computer programs through typed commands.

**Example:**
```bash
luminous-nix ask "install firefox"
```

*See also: [Terminal](#terminal), [Shell](#shell)*

### Claude AI
Large language model developed by Anthropic, used in the Sacred Trinity development methodology.

**Capabilities:**
- Complex reasoning
- Code generation
- Documentation
- Natural conversation

*See also: [LLM](#llm), [Sacred Trinity](#sacred-trinity)*

### Community Ownership
Business model where assets transition from investor ownership to community/user ownership over time.

**In Terra Lumina:**
- Projects transition after investors receive returns
- Local community takes full ownership
- Ensures lasting local benefit

*See also: [Regenerative Exit](#regenerative-exit), [Exit Timeline](#exit-timeline)*

### Consciousness-First Computing
Philosophy that technology should serve human consciousness and wellbeing rather than extract attention for engagement metrics.

**Five Pillars:**
1. Respect Attention
2. Amplify Capability
3. Maintain Transparency
4. Enable Sovereignty
5. Serve Wellbeing

*See also: [Seven Harmonies](#seven-harmonies), [Philosophy](#philosophy)*

### Configuration File
File containing settings and preferences for an application.

**Luminous Nix config:**
```yaml
# ~/.config/luminous-nix/config.yaml
llm:
  provider: ollama
  model: llama2
```

*See also: [YAML](#yaml), [dotfile](#dotfile)*

---

## D {#d}

### Daemon
Background process that runs continuously, providing services to other programs or users.

**Example:**
```bash
luminous-nix daemon --port 8765
```

*See also: [Service](#service), [Background Process](#background-process)*

### Declarative Configuration
Describing the desired state of a system rather than the steps to achieve it.

**NixOS example:**
```nix
services.postgresql.enable = true;  # Declare what you want
# (not how to install/configure it)
```

*See also: [NixOS](#nixos), [Imperative](#imperative)*

### Distribution (Investment)
Payment to investors from project returns.

**Terra Lumina:**
- Typically quarterly or annual
- Based on project revenue
- Must be claimed manually
- Transferred to chosen payment method

*See also: [Returns](#returns), [Portfolio](#portfolio)*

### Dotfile
Configuration files in Unix-like systems that start with a dot (.), typically hidden by default.

**Examples:**
- `~/.bashrc` - Bash configuration
- `~/.config/luminous-nix/config.yaml` - Luminous Nix settings
- `~/.nix-profile/` - Nix user profile

*See also: [Configuration File](#configuration-file)*

---

## E {#e}

### ESG (Environmental, Social, and Governance)
Framework for evaluating investments based on sustainability and ethical impact.

**Terra Lumina approach:**
- Goes beyond ESG with community ownership
- Direct impact on renewable energy
- Transparent reporting

*See also: [Impact Investing](#impact-investing), [Renewable Energy](#renewable-energy)*

### Exit Timeline
Period after which Terra Lumina investments transition to community ownership.

**Typical timeline:**
- 7-10 years from project operation
- Investors receive expected returns first
- Ownership transfers to local community
- Community benefits continue indefinitely

*See also: [Regenerative Exit](#regenerative-exit), [Community Ownership](#community-ownership)*

---

## F {#f}

### Flake
Modern Nix package and system configuration format providing reproducibility and composability.

**Benefits:**
- Locked dependencies
- Reproducible builds
- Easy sharing and composition

**Example:**
```nix
{
  inputs.luminous-nix.url = "github:Luminous-Dynamics/luminous-nix";
}
```

*See also: [NixOS](#nixos), [Reproducibility](#reproducibility)*

### Frontend
Client-side part of an application that users interact with directly.

**Terra Lumina frontend:**
- Vue.js 3 with TypeScript
- Material Design components
- Real-time updates via WebSockets

*See also: [Backend](#backend), [Web App](#web-app)*

---

## G {#g}

### GPU (Graphics Processing Unit)
Specialized processor originally designed for graphics but now used for parallel computations including AI.

**Use in Luminous Nix:**
- Ollama can use GPU for faster LLM inference
- Automatic detection and utilization
- Not required but improves performance

*See also: [LLM](#llm), [Ollama](#ollama)*

### GraphQL
Query language for APIs allowing clients to request exactly the data they need.

**Planned for Terra Lumina:**
- More flexible than REST
- Reduce over-fetching
- Better for complex queries

*See also: [API](#api), [REST API](#rest-api)*

---

## H {#h}

### Home Manager
NixOS tool for managing user-specific configuration and packages declaratively.

**Integration with Luminous Nix:**
```nix
programs.luminous-nix = {
  enable = true;
  llmProvider = "ollama";
};
```

*See also: [NixOS](#nixos), [Declarative Configuration](#declarative-configuration)*

### Hydro Power / Hydroelectric
Electricity generated from flowing or falling water.

**Types in Terra Lumina:**
- Run-of-river: Continuous flow without large dam
- Pumped storage: Energy storage using elevation
- Micro-hydro: Small-scale installations

*See also: [Renewable Energy](#renewable-energy), [Capacity Factor](#capacity-factor)*

---

## I {#i}

### Impact Investing
Investments made with intention to generate positive social or environmental impact alongside financial return.

**Terra Lumina approach:**
- Competitive returns (7-13% annually)
- Direct renewable energy impact
- Community ownership outcome
- Full transparency

*See also: [ESG](#esg), [Renewable Energy](#renewable-energy)*

### Imperative
Programming/configuration style describing steps to achieve a goal rather than the goal itself.

**Imperative (traditional):**
```bash
sudo apt update
sudo apt install firefox
```

**Declarative (NixOS):**
```nix
environment.systemPackages = [ pkgs.firefox ];
```

*See also: [Declarative Configuration](#declarative-configuration)*

### Intent
Structured representation of user's goal extracted from natural language.

**Luminous Nix intent:**
```python
Intent(
  action="install",
  target="firefox",
  parameters={},
  confidence=0.95
)
```

*See also: [Natural Language Processing](#natural-language-processing), [Parser](#parser)*

### IPFS (InterPlanetary File System)
Peer-to-peer distributed file system for storing and sharing data.

**In Terra Lumina:**
- Project documentation hashes
- Immutable document storage
- Verification of document authenticity

*See also: [Blockchain](#blockchain), [Smart Contract](#smart-contract)*

---

## J {#j}

### JSON (JavaScript Object Notation)
Lightweight data interchange format that's easy for humans to read and machines to parse.

**Example:**
```json
{
  "project_id": "prj_sunrise_solar",
  "amount": 500.00,
  "currency": "USD"
}
```

*See also: [API](#api), [YAML](#yaml)*

### JWT (JSON Web Token)
Secure method for representing claims between two parties, commonly used for authentication.

**In Terra Lumina API:**
- Access tokens for API authentication
- 1-hour expiration
- Refresh token for renewal

*See also: [OAuth](#oauth), [API Key](#api-key)*

---

## K {#k}

### KYC (Know Your Customer)
Identity verification process required by financial regulations to prevent fraud and money laundering.

**Terra Lumina requirements:**
- Government-issued ID
- Proof of address
- Selfie verification
- Usually completed in under 10 minutes

*See also: [AML](#aml), [Verification](#verification)*

### Kubernetes / K8s
Container orchestration platform for automating deployment, scaling, and management of applications.

*Note: Luminous Dynamics currently uses simpler deployment on NixOS, but may adopt Kubernetes for scaling.*

*See also: [Docker](#docker), [Microservices](#microservices)*

---

## L {#l}

### LLM (Large Language Model)
AI model trained on vast amounts of text to understand and generate human-like language.

**Examples:**
- GPT-4 (OpenAI)
- Claude (Anthropic)
- Llama 2 (Meta)

**In Luminous Nix:**
- Parses natural language commands
- Generates explanations
- Suggests solutions

*See also: [AI](#ai), [Ollama](#ollama)*

### Local LLM
Large language model running on your own hardware rather than cloud service.

**Benefits:**
- Complete privacy
- No API costs
- Offline capability
- Full control

**Luminous Nix support:**
- Ollama with Llama 2
- Mistral, CodeLlama
- Any Ollama-compatible model

*See also: [LLM](#llm), [Ollama](#ollama), [Sovereignty](#sovereignty)*

---

## M {#m}

### Microservices
Architectural pattern where applications are built as collection of small, independent services.

**Terra Lumina microservices:**
- User Service (auth, profiles)
- Investment Service (transactions)
- Project Service (project data)
- Blockchain Service (smart contracts)

*See also: [API](#api), [Backend](#backend)*

### Minting (Tokens)
Creating new blockchain tokens representing ownership or assets.

**In Terra Lumina:**
- Ownership tokens minted after investment
- Proportional to investment amount
- Immutable blockchain record
- Transferrable to community at exit

*See also: [Blockchain](#blockchain), [Smart Contract](#smart-contract)*

---

## N {#n}

### Natural Language Processing (NLP)
AI field focused on enabling computers to understand, interpret, and generate human language.

**In Luminous Nix:**
- Converts "install firefox" to structured command
- Understands variations ("add firefox", "I want firefox")
- Extracts intent and parameters

*See also: [LLM](#llm), [Intent](#intent)*

### Nix
Purely functional package manager enabling reproducible builds and declarative configuration.

**Key features:**
- Isolated package installations
- Rollback capability
- No dependency conflicts
- Cross-platform (Linux, macOS)

*See also: [NixOS](#nixos), [Flake](#flake)*

### NixOS
Linux distribution built on Nix package manager with declarative system configuration.

**Benefits:**
- Reproducible system configurations
- Atomic upgrades and rollbacks
- No configuration drift
- Perfect for Luminous Nix integration

*See also: [Nix](#nix), [Declarative Configuration](#declarative-configuration)*

---

## O {#o}

### OAuth (Open Authorization)
Open standard for access delegation, commonly used for token-based authentication.

**Terra Lumina OAuth flow:**
1. User authorizes application
2. Application receives code
3. Exchanges code for token
4. Uses token for API requests

*See also: [JWT](#jwt), [API](#api)*

### Ollama
Tool for running large language models locally on your computer.

**Features:**
- Easy model management
- GPU acceleration
- REST API
- Multiple model support

**In Luminous Nix:**
- Recommended for privacy
- Free to use
- Works offline

*See also: [LLM](#llm), [Local LLM](#local-llm)*

---

## P {#p}

### Parser
Component that analyzes natural language input and extracts structured information.

**Luminous Nix parser:**
Input: "install firefox and enable docker"
Output: [Install(firefox), Enable(docker)]

*See also: [Intent](#intent), [Natural Language Processing](#natural-language-processing)*

### Piper
Fast, local text-to-speech system used for voice interfaces.

**Features:**
- Multiple voice options
- Multiple languages
- Low latency
- Privacy-preserving (local processing)

**In Luminous Nix:**
- Speaks responses in voice mode
- Configurable voice and speed

*See also: [TTS](#tts), [Voice Interface](#voice-interface)*

### Polygon
Ethereum-compatible blockchain network offering lower transaction costs and faster confirmations.

**Why Terra Lumina uses Polygon:**
- Lower gas fees (~$0.001 vs $5-50)
- Faster confirmations (2 seconds)
- Ethereum compatibility
- Proof of Stake (environmentally friendly)

*See also: [Blockchain](#blockchain), [Smart Contract](#smart-contract)*

### Portfolio
Collection of investments held by an investor.

**Terra Lumina portfolio features:**
- Real-time valuation
- Diversification analysis
- Performance tracking
- Distribution management

*See also: [Distribution](#distribution), [Returns](#returns)*

---

## Q {#q}

### Query Language
Specialized language for requesting data from databases or APIs.

**Examples:**
- SQL (databases)
- GraphQL (APIs)
- Natural language (Luminous Nix)

*See also: [API](#api), [GraphQL](#graphql)*

---

## R {#r}

### Regenerative Exit
Business model where investments return to investors, then ownership transfers to community for ongoing benefit.

**Contrasted with extractive exit:**

**Extractive (traditional):**
```
Invest → Extract maximum → Exit to another corporation
Community left with corporate owner
```

**Regenerative (Terra Lumina):**
```
Invest → Fair returns → Transfer to community
Community owns asset permanently
```

*See also: [Community Ownership](#community-ownership), [Exit Timeline](#exit-timeline)*

### Renewable Energy
Energy from sources that naturally replenish.

**Types in Terra Lumina:**
- **Solar:** Photovoltaic panels, concentrated solar
- **Wind:** Onshore, offshore turbines
- **Hydro:** Run-of-river, pumped storage
- **Storage:** Batteries, thermal storage
- **Other:** Geothermal, tidal, wave

*See also: [Solar Power](#solar-power), [Wind Power](#wind-power)*

### Reproducibility
Ability to recreate exact same result from same inputs.

**NixOS reproducibility:**
```nix
# This will produce identical system
# on any computer:
environment.systemPackages = [
  pkgs.firefox
  pkgs.vim
];
```

*See also: [Declarative Configuration](#declarative-configuration), [Nix](#nix)*

### REST API (Representational State Transfer)
Architectural style for APIs using HTTP methods (GET, POST, PUT, DELETE) and standard status codes.

**Terra Lumina REST API:**
```
GET    /v1/projects      - List projects
POST   /v1/investments   - Create investment
GET    /v1/portfolio     - Get portfolio
```

*See also: [API](#api), [HTTP](#http)*

### Returns
Financial gains from investments.

**Terra Lumina returns:**
- Annual distributions (typically quarterly)
- Capital appreciation
- Expected: 7-13% annually
- Paid from project revenue

*See also: [Distribution](#distribution), [Portfolio](#portfolio)*

---

## S {#s}

### Sacred Trinity
Development methodology using Human + Cloud AI + Local LLM collaboration.

**Roles:**
- **Human (Conscious):** Vision, values, decisions
- **Claude AI (Capable):** Complex reasoning, code
- **Local LLM (Sovereign):** Privacy, offline, ownership

**Result:** Built Luminous Nix for $200/month vs $4.2M traditional cost.

*See also: [Claude AI](#claude-ai), [Local LLM](#local-llm)*

### SDK (Software Development Kit)
Collection of tools, libraries, and documentation for building applications on a platform.

**Terra Lumina SDKs:**
- Python: `pip install terra-lumina`
- JavaScript: `npm install @terra-lumina/sdk`
- Ruby: `gem install terra_lumina`

*See also: [API](#api), [Client Library](#client-library)*

### Seven Harmonies
Seven guiding principles for consciousness-first technology.

1. Intentionality Over Engagement
2. Transparency Over Simplicity
3. Capability Over Dependency
4. Relationship Over Transaction
5. Regeneration Over Extraction
6. Presence Over Distraction
7. Community Over Consumption

*See also: [Consciousness-First Computing](#consciousness-first-computing)*

### Shell
Command-line interpreter that processes and executes commands.

**Common shells:**
- Bash (most common)
- Zsh (macOS default)
- Fish (user-friendly)

*See also: [CLI](#cli), [Terminal](#terminal)*

### Smart Contract
Self-executing program on blockchain that automatically enforces agreement terms.

**Terra Lumina smart contracts:**
- Mint ownership tokens
- Record investments
- Track distributions
- Transfer to community at exit

*See also: [Blockchain](#blockchain), [Polygon](#polygon)*

### Solar Power
Electricity generated from sunlight using photovoltaic panels.

**Types:**
- **Utility-scale:** Large ground-mounted arrays (50+ MW)
- **Rooftop:** Building-mounted systems
- **Community solar:** Shared arrays for multiple subscribers

**Typical returns in Terra Lumina:** 8-12% annually

*See also: [Renewable Energy](#renewable-energy), [Capacity Factor](#capacity-factor)*

### Sovereignty
User control over their own data, systems, and digital life.

**Luminous Dynamics approach:**
- Local LLM option (no cloud dependency)
- Open source code (inspect, modify, control)
- Self-hostable
- No vendor lock-in

*See also: [Local LLM](#local-llm), [Privacy](#privacy)*

---

## T {#t}

### Terminal
Text-based interface for interacting with operating system and programs.

**Also called:**
- Command line
- Console
- Shell (technically the program running in terminal)

*See also: [CLI](#cli), [Shell](#shell)*

### Token (Authentication)
Credential used to access protected resources without repeatedly sending username/password.

**Types:**
- Access token (short-lived, 1 hour)
- Refresh token (long-lived, 30 days)
- API key (permanent until revoked)

*See also: [JWT](#jwt), [OAuth](#oauth)*

### Token (Blockchain)
Digital asset representing ownership, utility, or rights on a blockchain.

**Terra Lumina ownership tokens:**
- Represent investment share
- Minted on Polygon blockchain
- Proportional to investment amount
- Transferrable to community at exit

*See also: [Blockchain](#blockchain), [Minting](#minting)*

### TTS (Text-to-Speech)
Technology converting written text into spoken voice.

**In Luminous Nix:**
- Piper TTS engine
- Multiple voices and languages
- Local processing (privacy)
- Adjustable speed and pitch

*See also: [Piper](#piper), [Voice Interface](#voice-interface)*

---

## V {#v}

### Verification (Identity)
Process of confirming user identity for security and regulatory compliance.

**See:** [KYC](#kyc)

### Voice Interface
System allowing users to interact with computer through spoken commands.

**Luminous Nix voice features:**
- Wake word activation
- Natural language commands
- Spoken confirmations
- Multiple language support
- Adjustable voice responses

*See also: [Whisper](#whisper), [Piper](#piper)*

---

## W {#w}

### WebSocket
Communication protocol providing full-duplex communication channels over single TCP connection.

**In Terra Lumina:**
- Real-time portfolio updates
- Live project funding progress
- Instant distribution notifications

*See also: [REST API](#rest-api), [Real-time](#real-time)*

### Whisper
OpenAI's speech recognition system used for converting speech to text.

**In Luminous Nix:**
- Processes voice commands
- Multiple language support
- Runs locally (privacy-preserving)
- Multiple model sizes (tiny to large)

*See also: [Voice Interface](#voice-interface), [Speech Recognition](#speech-recognition)*

### Wind Power
Electricity generated from wind using turbines.

**Types:**
- **Onshore:** Land-based turbines
- **Offshore:** Ocean-based turbines (higher capacity)
- **Floating:** Deep-water installations

**Typical returns in Terra Lumina:** 9-13% annually

*See also: [Renewable Energy](#renewable-energy), [Capacity Factor](#capacity-factor)*

---

## Y {#y}

### YAML (YAML Ain't Markup Language)
Human-readable data serialization format commonly used for configuration files.

**Example (Luminous Nix config):**
```yaml
llm:
  provider: ollama
  model: llama2
voice:
  enabled: true
  wake_word: "hey nix"
```

*See also: [Configuration File](#configuration-file), [JSON](#json)*

---

## Symbols & Acronyms

### ~/.config
User configuration directory in Unix-like systems.

**Luminous Nix config location:**
```
~/.config/luminous-nix/config.yaml
```

### API
See [API (Application Programming Interface)](#api)

### CLI
See [CLI (Command-Line Interface)](#cli)

### KYC
See [KYC (Know Your Customer)](#kyc)

### LLM
See [LLM (Large Language Model)](#llm)

### NLP
See [Natural Language Processing](#natural-language-processing)

### TTS
See [TTS (Text-to-Speech)](#tts)

---

## Related Resources

**Documentation:**
- [Luminous Nix User Guide](luminous-nix/user-guide.md)
- [Terra Lumina Getting Started](terra-lumina/getting-started.md)
- [Philosophy](philosophy/index.md)

**Technical:**
- [Luminous Nix API Reference](luminous-nix/api.md)
- [Terra Lumina API Reference](terra-lumina/api.md)
- [Development Guide](luminous-nix/development.md)

**Community:**
- [Discord](https://discord.gg/luminous)
- [GitHub Discussions](https://github.com/Luminous-Dynamics)
- [Community Forum](https://community.luminousdynamics.org)

---

## Contributing to Glossary

Missing a term? Found an error?

- **Submit PR:** [Edit on GitHub](https://github.com/Luminous-Dynamics/docs)
- **Suggest term:** Email docs@luminousdynamics.org
- **Discuss:** [Discord #documentation](https://discord.gg/luminous)

---

*\"Clear definitions empower understanding.\"*

*Last updated: November 15, 2025*

[Back to Docs Home](index.md)
