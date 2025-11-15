# Luminous Dynamics Documentation

> *Technology that remembers it exists to serve consciousness, not consume it.*

This repository contains the complete documentation for Luminous Dynamics projects, built with MkDocs Material.

**Live site:** [docs.luminousdynamics.org](https://docs.luminousdynamics.org)

## What's Documented

### 🗣️ [Luminous Nix](docs/luminous-nix/index.md)

Natural language interface for NixOS system management.

- [Quick Start](docs/luminous-nix/quickstart.md) - Get running in 10 minutes
- [User Guide](docs/luminous-nix/user-guide.md) - Complete feature documentation
- [Voice Interface](docs/luminous-nix/voice.md) - Hands-free control
- [Advanced Features](docs/luminous-nix/advanced.md) - Power user capabilities
- [FAQ](docs/luminous-nix/faq.md) - Common questions

### 💡 [Terra Lumina](docs/terra-lumina/index.md)

Renewable energy investment platform with Regenerative Exit model.

- [Getting Started](docs/terra-lumina/getting-started.md) - From signup to first investment
- [FAQ](docs/terra-lumina/faq.md) - Investment questions answered
- [Atlas Platform](https://atlas.luminousdynamics.io) - Live project browser

### 🧘 [Philosophy](docs/philosophy/index.md)

The consciousness-first computing framework.

- [Consciousness-First Computing](docs/philosophy/consciousness-first.md) - Core principles
- [Sacred Trinity Model](docs/philosophy/sacred-trinity.md) - Development methodology
- [Technology & Spirit](docs/philosophy/technology-spirit.md) - Tech as spiritual practice
- [Seven Harmonies](docs/philosophy/seven-harmonies.md) - Guiding principles

### 🤝 [Community](docs/community/index.md)

Join the movement for conscious technology.

- [Contributing](docs/community/contributing.md) - How to help
- [Code of Conduct](docs/community/code-of-conduct.md) - Community values
- [Support](docs/community/support.md) - Getting help
- [Discussions](docs/community/discussions.md) - Join conversations

## Local Development

### Prerequisites

- Python 3.8+
- pip

### Setup

```bash
# Clone repository
git clone https://github.com/Luminous-Dynamics/docs.git
cd docs

# Install dependencies
pip install mkdocs-material

# Serve locally
mkdocs serve

# Visit http://localhost:8000
```

### Building

```bash
# Build static site
mkdocs build

# Output in site/
```

## Contributing

We welcome documentation improvements!

**Common contributions:**

- Fix typos and improve clarity
- Add examples and tutorials
- Update screenshots
- Translate content
- Report broken links

See [Contributing Guide](docs/community/contributing.md) for details.

## Documentation Structure

```
docs/
├── index.md                 # Homepage
├── luminous-nix/           # Luminous Nix documentation
│   ├── index.md
│   ├── quickstart.md
│   ├── user-guide.md
│   ├── advanced.md
│   ├── voice.md
│   └── faq.md
├── terra-lumina/           # Terra Lumina documentation
│   ├── index.md
│   ├── getting-started.md
│   └── faq.md
├── philosophy/             # Philosophical framework
│   ├── index.md
│   ├── consciousness-first.md
│   ├── sacred-trinity.md
│   ├── technology-spirit.md
│   └── seven-harmonies.md
├── community/              # Community resources
│   ├── index.md
│   ├── contributing.md
│   ├── code-of-conduct.md
│   ├── support.md
│   └── discussions.md
└── blog/                   # Blog (coming soon)
    └── index.md
```

## Deployment

Documentation automatically deploys to GitHub Pages via GitHub Actions:

- **Trigger:** Push to `main` branch
- **Build:** MkDocs Material
- **Deploy:** GitHub Pages
- **Domain:** docs.luminousdynamics.org

Manual deployment:

```bash
./deploy-docs.sh
```

## Configuration

Site configuration in `mkdocs.yml`:

- **Theme:** Material for MkDocs
- **Colors:** Deep purple primary, purple accent
- **Features:** Instant navigation, search, code copy, tabs
- **Plugins:** Search with advanced separator
- **Extensions:** Admonitions, code highlighting, Mermaid diagrams

## Style Guide

**Voice:** Conversational but professional, warm but clear

**Tone:** Optimistic and empowering, honest about challenges

**Technical level:** Progressive disclosure - simple intro, deep technical detail available

**Code examples:** Always tested and working

**Philosophy:** Every page reflects consciousness-first principles

## Linting & Quality

```bash
# Check links
mkdocs build --strict

# Spell check (if installed)
codespell docs/

# Markdown lint
markdownlint docs/
```

## License

Documentation licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

Code examples licensed under MIT.

## Questions?

- 📖 [Documentation Issues](https://github.com/Luminous-Dynamics/docs/issues)
- 💬 [Discussions](https://github.com/orgs/Luminous-Dynamics/discussions)
- 📧 Email: docs@luminousdynamics.org

---

**Built with 💜 by humans who believe technology can serve consciousness**

*Last updated: November 14, 2025*
