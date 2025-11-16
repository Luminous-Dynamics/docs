# Luminous Dynamics Documentation

> *Technology that remembers it exists to serve consciousness, not consume it.*

**Complete documentation for consciousness-first computing.**

**Live site:** [docs.luminousdynamics.org](https://docs.luminousdynamics.org)

[![Documentation](https://img.shields.io/badge/docs-luminousdynamics.org-purple)](https://docs.luminousdynamics.org)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Built with Material for MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)

---

## 📊 Documentation Stats

- **47 comprehensive pages**
- **~195,000 words** (equivalent to 2-3 books)
- **5 hands-on tutorials**
- **7 detailed case studies**
- **3 substantive blog posts**
- **100% coverage** - From beginner to enterprise

**Last major update:** November 16, 2025 (Phase 10 complete)

---

## 🗺️ What's Documented

### 🖥️ [Luminous Nix](docs/luminous-nix/index.md)

Natural language interface for NixOS. Talk to your computer in plain English.

**Quick links:**
- [Quick Start](docs/luminous-nix/quickstart.md) - Install in 15 minutes
- [User Guide](docs/luminous-nix/user-guide.md) - Complete usage documentation
- [Migration Guide](docs/luminous-nix/migration-guide.md) - From apt, dnf, pacman, brew
- [Comparisons](docs/luminous-nix/comparisons.md) - vs traditional package managers
- [Deployment Guide](docs/luminous-nix/deployment.md) - Enterprise deployment
- [Voice Interface](docs/luminous-nix/voice.md) - Hands-free system management
- [Advanced Features](docs/luminous-nix/advanced.md) - Power user capabilities
- [API Reference](docs/luminous-nix/api.md) - Developer documentation
- [FAQ](docs/luminous-nix/faq.md) - Common questions

### 🌞 [Terra Lumina](docs/terra-lumina/index.md)

Renewable energy investment platform. Invest in solar, wind, hydro starting at $10.

**Quick links:**
- [Getting Started](docs/terra-lumina/getting-started.md) - First investment in 20 minutes
- [Investment Guide](docs/terra-lumina/investment-guide.md) - Comprehensive investing documentation
- [Migration from Traditional](docs/terra-lumina/migration-from-traditional.md) - From stocks, bonds, REITs
- [Comparisons](docs/terra-lumina/comparisons.md) - vs traditional investments
- [Technical Specs](docs/terra-lumina/technical.md) - How it works
- [Energy Projects](docs/terra-lumina/projects.md) - Browse opportunities
- [API Reference](docs/terra-lumina/api.md) - Developer API
- [FAQ](docs/terra-lumina/faq.md) - Investment questions

### 🧘 [Philosophy](docs/philosophy/index.md)

The consciousness-first computing framework that guides everything we build.

- [Consciousness-First Computing](docs/philosophy/consciousness-first.md) - Core principles
- [Seven Harmonies](docs/philosophy/seven-harmonies.md) - Guiding development principles
- [Sacred Trinity](docs/philosophy/sacred-trinity.md) - Human + AI + Local LLM methodology
- [Technology & Spirit](docs/philosophy/technology-spirit.md) - Tech as spiritual practice

### 👥 [Community](docs/community/index.md)

Join the movement for conscious technology.

- [Contributing](docs/community/contributing.md) - How to help
- [Code of Conduct](docs/community/code-of-conduct.md) - Community values
- [Support](docs/community/support.md) - Getting help
- [Discussions](docs/community/discussions.md) - Join conversations

### 📚 [Resources](docs/documentation-map.md)

Comprehensive learning and reference materials.

- [Documentation Map](docs/documentation-map.md) - Navigate all 47 pages
- [Decision Trees](docs/decision-trees.md) - Which product? Which strategy?
- [Comparison Matrices](docs/comparison-matrices.md) - Visual comparisons
- [Tutorials](docs/tutorials.md) - 5 hands-on tutorials
- [Advanced Use Cases](docs/advanced-use-cases.md) - Real-world examples
- [Quick Reference](docs/quick-reference.md) - Cheat sheets
- [Case Studies](docs/case-studies.md) - 7 user success stories
- [Troubleshooting](docs/troubleshooting.md) - Common issues solved
- [Glossary](docs/glossary.md) - Terminology
- [Roadmap](docs/roadmap.md) - What's coming

### 📝 [Blog](docs/blog/index.md)

Insights, stories, and deep dives.

- [Luminous Nix v1.0 Launch](docs/blog/2025-11-11-luminous-nix-launch.md) - The revolution begins
- [Sacred Trinity Development](docs/blog/2025-11-13-sacred-trinity-story.md) - $200/month vs $4.2M
- [Regenerative Exit Model](docs/blog/2025-11-15-regenerative-exit-model.md) - Community ownership

---

## 🚀 Quick Start (For Contributors)

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

### Preview Changes

```bash
# Serve with live reload
mkdocs serve

# Build in strict mode (catch broken links)
mkdocs build --strict
```

---

## 📁 Documentation Structure

```
docs/
├── index.md                          # Homepage
├── getting-started.md                # Universal getting started
├── documentation-map.md              # Complete navigation guide
├── decision-trees.md                 # Interactive decision support
├── comparison-matrices.md            # Visual comparisons
├── tutorials.md                      # 5 hands-on tutorials
├── advanced-use-cases.md             # Real-world advanced examples
├── quick-reference.md                # Cheat sheets
├── case-studies.md                   # 7 success stories
├── troubleshooting.md                # Problem solving
├── glossary.md                       # Terminology
├── roadmap.md                        # Future plans
│
├── luminous-nix/                     # Luminous Nix docs
│   ├── index.md                      # Product overview
│   ├── quickstart.md                 # 15-minute start
│   ├── user-guide.md                 # Complete usage
│   ├── migration-guide.md            # From apt/dnf/pacman/brew
│   ├── comparisons.md                # Detailed comparisons
│   ├── advanced.md                   # Power user features
│   ├── deployment.md                 # Enterprise deployment
│   ├── voice.md                      # Voice interface
│   ├── development.md                # Contributing
│   ├── api.md                        # API reference
│   └── faq.md                        # Common questions
│
├── terra-lumina/                     # Terra Lumina docs
│   ├── index.md                      # Product overview
│   ├── getting-started.md            # First investment
│   ├── investment-guide.md           # Comprehensive guide
│   ├── migration-from-traditional.md # From stocks/bonds/REITs
│   ├── comparisons.md                # Detailed comparisons
│   ├── technical.md                  # How it works
│   ├── projects.md                   # Browse opportunities
│   ├── api.md                        # API reference
│   └── faq.md                        # Investment questions
│
├── philosophy/                       # Philosophy docs
│   ├── index.md                      # Philosophy overview
│   ├── consciousness-first.md        # Core principles
│   ├── seven-harmonies.md            # Guiding principles
│   ├── sacred-trinity.md             # Development methodology
│   └── technology-spirit.md          # Tech as practice
│
├── community/                        # Community docs
│   ├── index.md                      # Community overview
│   ├── contributing.md               # How to contribute
│   ├── code-of-conduct.md            # Community values
│   ├── support.md                    # Getting help
│   └── discussions.md                # Join conversations
│
└── blog/                             # Blog
    ├── index.md                      # Blog home
    ├── 2025-11-11-luminous-nix-launch.md
    ├── 2025-11-13-sacred-trinity-story.md
    └── 2025-11-15-regenerative-exit-model.md
```

---

## 🎨 Configuration

Site configuration in `mkdocs.yml`:

**Theme:**
- Material for MkDocs
- Deep purple primary, purple accent
- Light/dark mode support

**Features:**
- Instant navigation with prefetch
- Advanced search with suggestions
- Code copy buttons
- Content tabs
- Table of contents integration
- Navigation breadcrumbs

**Extensions:**
- Admonitions (notes, warnings, tips)
- Code highlighting (100+ languages)
- Mermaid diagrams
- Tables
- Task lists
- Footnotes

---

## ✍️ Contributing

We welcome documentation improvements!

**Common contributions:**
- Fix typos and improve clarity
- Add examples and tutorials
- Update screenshots
- Translate content
- Report broken links
- Improve navigation
- Add diagrams

**Process:**
1. Fork the repository
2. Create a branch (`git checkout -b improve-docs`)
3. Make your changes
4. Test locally (`mkdocs serve`)
5. Submit pull request

See [Contributing Guide](docs/community/contributing.md) for details.

---

## 📝 Style Guide

**Voice:** Conversational but professional, warm but clear

**Tone:** Optimistic and empowering, honest about challenges

**Technical level:** Progressive disclosure
- Simple intro for everyone
- Deep technical detail available
- Multiple entry points by experience level

**Code examples:**
- Always tested and working
- Include expected output
- Explain what's happening
- Provide troubleshooting

**Philosophy:** Every page reflects consciousness-first principles
- Respect attention (no manipulation)
- Amplify capability (genuinely helpful)
- Maintain transparency (honest about limitations)
- Enable sovereignty (users control their journey)
- Serve wellbeing (optimize for humans, not metrics)

---

## 🔍 Quality Checks

```bash
# Check for broken links
mkdocs build --strict

# Spell check (if installed)
codespell docs/

# Markdown lint (if installed)
markdownlint docs/

# Local preview
mkdocs serve
```

---

## 🚀 Deployment

Documentation automatically deploys to GitHub Pages:

- **Trigger:** Push to `main` branch
- **Build:** MkDocs Material via GitHub Actions
- **Deploy:** GitHub Pages
- **Domain:** docs.luminousdynamics.org

**Manual deployment:**

```bash
# Build and deploy
mkdocs gh-deploy

# Or use deployment script
./deploy-docs.sh
```

---

## 📊 Documentation Phases

This documentation was built across 10 comprehensive phases:

1. **Phase 1:** Critical fixes (dates, naming, links)
2. **Phase 2-3:** Foundation (quickstarts, philosophy, community)
3. **Phase 4-5:** Products (user guides, technical specs, APIs)
4. **Phase 6:** User experience (case studies, troubleshooting, glossary)
5. **Phase 7:** Excellence (homepage, quick reference, navigation)
6. **Phase 8:** Practical content (tutorials, blog posts)
7. **Phase 9:** Advanced/enterprise (migration, comparisons, deployment)
8. **Phase 10:** Navigation & discovery (map, decision trees, matrices)

**Result:** 47 pages, ~195,000 words, 100% coverage

---

## 🔗 Cross-Repository Consistency

See [CROSS_REPO_CHECKLIST.md](CROSS_REPO_CHECKLIST.md) for ensuring consistency across:
- This docs repository
- luminous-nix repository
- terra-lumina repository
- Main website (luminousdynamics.org)
- Social media and other properties

---

## 📜 License

**Documentation:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- Free to share and adapt
- Must give appropriate credit
- No additional restrictions

**Code examples:** MIT License
- Free to use, modify, distribute
- Include copyright notice

---

## ❓ Questions?

- 📖 **[Documentation Issues](https://github.com/Luminous-Dynamics/docs/issues)** - Report problems
- 💬 **[GitHub Discussions](https://github.com/orgs/Luminous-Dynamics/discussions)** - Ask questions
- 🗣️ **[Discord Community](https://discord.gg/luminous)** - Real-time chat
- 📧 **Email:** docs@luminousdynamics.org

---

## 🌟 Acknowledgments

**Built with:**
- [MkDocs](https://www.mkdocs.org/) - Static site generator
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) - Beautiful theme
- [GitHub Pages](https://pages.github.com/) - Hosting
- [Sacred Trinity methodology](docs/philosophy/sacred-trinity.md) - Human + AI collaboration

**Special thanks:**
- Every contributor who improved the documentation
- Community members who asked questions (you shaped this)
- Users who reported issues and suggested improvements

---

**Built with 💜 by humans who believe technology can serve consciousness**

*Documentation version 1.0 - Last updated: November 16, 2025*
