# Contributing to Luminous Dynamics

Thank you for your interest in contributing! Whether you're fixing a typo, adding a feature, or improving documentation, your contributions help build technology that amplifies consciousness rather than consumes it.

## 🌟 Ways to Contribute

You don't need to be a coder to contribute! We welcome all forms of contribution:

### 💻 Code

- Fix bugs
- Add features
- Improve performance
- Write tests
- Refactor code

### 📖 Documentation

- Fix typos and improve clarity
- Add examples and tutorials
- Translate documentation
- Create video guides
- Improve API docs

### 🎨 Design

- UI/UX improvements
- Visual assets and graphics
- Accessibility enhancements
- User experience research

### 🧪 Testing

- Report bugs
- Test new features
- Provide feedback on UX
- Create test cases
- Beta testing

### 💬 Community

- Answer questions in Discord/Discussions
- Welcome new members
- Write blog posts or tutorials
- Share on social media
- Organize events or meetups

### 🌍 Other

- Translate interfaces
- Improve accessibility
- Share user stories
- Provide domain expertise
- Sponsor the project

## 🚀 Getting Started

### 1. Choose Your Adventure

**I want to fix something specific** → Jump to [Making Changes](#making-changes)

**I want to help but don't know where** → Check [Good First Issues](#finding-something-to-work-on)

**I have an idea for a feature** → Start a [Discussion](https://github.com/orgs/Luminous-Dynamics/discussions)

**I found a bug** → [Report it](#reporting-bugs)

### 2. Set Up Your Environment

#### For Luminous Nix

```bash
# Clone the repository
git clone https://github.com/Luminous-Dynamics/luminous-nix.git
cd luminous-nix

# Install dependencies (using Poetry)
poetry install

# Activate virtual environment
poetry shell

# Run tests to verify setup
pytest

# Run Luminous Nix locally
python -m luminous_nix
```

**Requirements:**

- Python 3.11+
- NixOS (for full testing)
- Poetry for dependency management
- Ollama for local LLM (optional for testing)

#### For Terra Lumina

```bash
# Clone the repository
git clone https://github.com/Luminous-Dynamics/terra-lumina.git
cd terra-lumina

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env
# Edit .env with your values

# Run development server
npm run dev
```

**Requirements:**

- Node.js 18+
- PostgreSQL (or Supabase account)
- Environment variables configured

#### For Documentation

```bash
# Clone the docs repository
git clone https://github.com/Luminous-Dynamics/docs.git
cd docs

# Install MkDocs and dependencies
pip install mkdocs-material

# Serve documentation locally
mkdocs serve

# View at http://localhost:8000
```

**Requirements:**

- Python 3.8+
- MkDocs Material theme

## 🔍 Finding Something to Work On

### Good First Issues

We label beginner-friendly issues with `good first issue`:

- [Luminous Nix: Good First Issues](https://github.com/Luminous-Dynamics/luminous-nix/labels/good%20first%20issue)
- [Terra Lumina: Good First Issues](https://github.com/Luminous-Dynamics/terra-lumina/labels/good%20first%20issue)
- [Docs: Good First Issues](https://github.com/Luminous-Dynamics/docs/labels/good%20first%20issue)

### Help Wanted

For more challenging issues:

- [Luminous Nix: Help Wanted](https://github.com/Luminous-Dynamics/luminous-nix/labels/help%20wanted)
- [Terra Lumina: Help Wanted](https://github.com/Luminous-Dynamics/terra-lumina/labels/help%20wanted)

### Current Priorities

**High priority areas:**

- User guide documentation
- Voice interface improvements
- Accessibility enhancements
- Test coverage
- Performance optimization

Check the [project boards](https://github.com/orgs/Luminous-Dynamics/projects) for current priorities.

## 📝 Making Changes

### The Process

1. **Fork the repository** (unless you have write access)
2. **Create a branch** from `main`: `git checkout -b feature/your-feature-name`
3. **Make your changes**
4. **Write or update tests** (if applicable)
5. **Update documentation** (if applicable)
6. **Test your changes** thoroughly
7. **Commit with a clear message** (see [Commit Guidelines](#commit-guidelines))
8. **Push to your fork**
9. **Open a Pull Request**

### Branch Naming

Use descriptive branch names:

- `feature/add-voice-commands` - New features
- `fix/installation-error` - Bug fixes
- `docs/improve-quickstart` - Documentation
- `refactor/nlp-pipeline` - Code refactoring
- `test/add-integration-tests` - Testing

### Commit Guidelines

**Format:**

```
<type>: <short description>

<optional detailed description>

<optional footer>
```

**Types:**

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code restructuring without behavior changes
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**

```
feat: Add voice command for package search

Implemented voice activation for searching packages using
Whisper speech recognition. Includes fallback to text input
if microphone access fails.

Closes #123
```

```
fix: Handle network timeout in model download

Added retry logic with exponential backoff for model downloads.
Shows clear error message if all retries fail.

Fixes #456
```

```
docs: Improve quickstart installation steps

Added troubleshooting section and clarified NixOS version
requirements. Included screenshots of expected output.
```

### Code Style

#### Python (Luminous Nix)

**We use:**

- **Black** for code formatting
- **isort** for import sorting
- **pylint** for linting
- **mypy** for type checking

**Before committing:**

```bash
# Format code
black .
isort .

# Check linting
pylint luminous_nix/

# Type check
mypy luminous_nix/
```

**Style guidelines:**

- Use type hints for function signatures
- Write docstrings for public functions
- Keep functions focused and small
- Prefer clarity over cleverness

#### JavaScript/TypeScript (Terra Lumina)

**We use:**

- **Prettier** for formatting
- **ESLint** for linting
- **TypeScript** for type safety

**Before committing:**

```bash
# Format and lint
npm run lint
npm run format

# Type check
npm run type-check
```

#### Documentation (Markdown)

**Guidelines:**

- One sentence per line (makes diffs clearer)
- Use `##` for top-level sections (not `#`)
- Include code examples where helpful
- Add alt text to images
- Check links aren't broken

### Testing

#### Luminous Nix Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=luminous_nix

# Run specific test file
pytest tests/test_nlp.py

# Run tests matching pattern
pytest -k "test_voice"
```

**Writing tests:**

- Write tests for new features
- Update tests when changing behavior
- Aim for >80% coverage on new code
- Include edge cases

#### Terra Lumina Tests

```bash
# Run all tests
npm test

# Run with coverage
npm run test:coverage

# Run specific test
npm test -- projects.test.ts

# Watch mode
npm run test:watch
```

### Documentation

**When to update docs:**

- ✅ Adding a new feature
- ✅ Changing existing behavior
- ✅ Fixing a bug that affects usage
- ✅ Adding configuration options
- ✅ Improving error messages

**What to update:**

- API documentation
- User guides
- README files
- CHANGELOG
- Code comments (for complex logic)

## 🐛 Reporting Bugs

### Before Reporting

1. **Search existing issues** - Your bug might already be reported
2. **Try latest version** - Bug might be fixed
3. **Check documentation** - Might be expected behavior
4. **Simplify reproduction** - Isolate the issue

### Creating a Bug Report

**Use the bug report template** or include:

1. **Clear title**: "Voice input fails on NixOS 23.11 with PulseAudio"
2. **Environment**:
   - OS and version
   - Luminous Nix / Terra Lumina version
   - Relevant configuration
3. **Steps to reproduce**:
   - Exact commands or actions
   - Minimal reproduction case
4. **Expected behavior**: What should happen
5. **Actual behavior**: What actually happens
6. **Error messages**: Full error output (use code blocks)
7. **Additional context**: Screenshots, logs, etc.

**Example:**

```markdown
## Bug: Installation fails on NixOS 23.05

**Environment:**
- NixOS 23.05
- Luminous Nix v1.0.0
- Python 3.11.6

**Steps to Reproduce:**
1. Run `curl -L https://...install.sh | sh`
2. Script downloads binary
3. Fails with permission error

**Expected:** Binary installed to /usr/local/bin/
**Actual:** Error: Permission denied

**Error Output:**
\```
mv: cannot move 'luminous-nix' to '/usr/local/bin/luminous-nix': Permission denied
\```

**Fix:** Installation script needs sudo, but doesn't prompt for it.
```

## 💡 Proposing Features

### Before Proposing

1. **Check if it aligns** with [consciousness-first principles](../philosophy/consciousness-first.md)
2. **Search discussions** - Maybe already proposed
3. **Consider scope** - Does this fit the project's vision?
4. **Think about alternatives** - Are there other approaches?

### Creating a Feature Proposal

**Start a [GitHub Discussion](https://github.com/orgs/Luminous-Dynamics/discussions) with:**

1. **Problem statement**: What problem does this solve?
2. **Proposed solution**: How would this feature work?
3. **User value**: How does this help users?
4. **Consciousness-first**: How does this align with our values?
5. **Alternatives considered**: What other approaches did you consider?
6. **Open questions**: What needs to be figured out?

**Example:**

```markdown
## Feature: Offline Documentation Access

**Problem:**
Users in low-connectivity environments can't access docs when they need help.

**Proposed Solution:**
Bundle documentation with Luminous Nix for offline access via
`luminous-nix docs [topic]` command.

**User Value:**
- Works anywhere (airplanes, remote locations, poor internet)
- Faster than web lookup
- Privacy-preserving (no external requests)

**Consciousness-First Alignment:**
- Respects attention (faster access to needed info)
- Enables sovereignty (works without external dependencies)
- Amplifies capability (help always available)

**Alternatives Considered:**
1. Web-only docs (current state - requires internet)
2. Man pages (not as user-friendly)
3. Integrated TUI help (limited space)

**Open Questions:**
- How to keep offline docs in sync with updates?
- Size impact on download?
- Which docs to include?
```

## 🔄 Pull Request Process

### Before Submitting

✅ **Code works** - Tested locally
✅ **Tests pass** - All existing tests still pass
✅ **New tests added** - For new functionality
✅ **Docs updated** - If behavior changes
✅ **Style checked** - Linting passes
✅ **Commits clean** - Clear, descriptive messages
✅ **Branch up-to-date** - Rebased on latest main

### Creating the PR

**Title format:**

```
<type>: <concise description>
```

**Description should include:**

1. **What changed** - Summary of changes
2. **Why** - Motivation and context
3. **How tested** - Testing methodology
4. **Screenshots** - For UI changes
5. **Related issues** - `Closes #123` or `Relates to #456`
6. **Breaking changes** - If any, clearly marked
7. **Checklist** - Completed items

**Use the PR template!**

### Review Process

1. **Automated checks run** - CI/CD, linting, tests
2. **Maintainer reviews** - Usually within 1-3 days
3. **Discussion & iteration** - Address feedback
4. **Approval** - Once ready
5. **Merge** - Maintainer merges

**Tips for faster review:**

- Smaller PRs are reviewed faster
- Clear description helps reviewers
- Respond to feedback promptly
- Be open to suggestions
- Follow the style guide

### After Merging

- **Delete your branch** (GitHub will prompt)
- **Update your fork** - Pull latest main
- **Celebrate!** 🎉 You made technology better

## 🏆 Recognition

We recognize contributors in multiple ways:

### GitHub

- Listed in [Contributors page](https://github.com/Luminous-Dynamics/luminous-nix/graphs/contributors)
- Mentioned in release notes
- GitHub achievements and badges

### Documentation

- Major contributors listed in README
- Philosophy contributors credited
- Tutorial authors acknowledged

### Community

- Monthly shoutouts in newsletter
- Recognition in Discord
- Swag for active contributors (coming soon)

### Professional

- Happy to provide references
- Testimonials for résumés
- LinkedIn recommendations

## 💜 Consciousness-First Contributing

Our contribution process follows consciousness-first principles:

### Respect Attention

- **Clear guidelines** - Don't waste contributor time
- **Fast feedback** - Review PRs within 1-3 days
- **Honest timelines** - Communicate delays
- **Efficient process** - Minimize bureaucracy

### Amplify Capability

- **Good first issues** - Onboard new contributors
- **Detailed feedback** - Help contributors learn
- **Pair programming** - Offer to help via Discord
- **Documentation** - Make contributing easier

### Maintain Transparency

- **Public discussions** - All decisions visible
- **Clear criteria** - Know what gets merged
- **Open roadmap** - See project direction
- **Honest feedback** - Clear, constructive reviews

### Enable Sovereignty

- **Fork-friendly** - Easy to fork and modify
- **No CLAs** - Just standard open source license
- **Credit given** - Your work is recognized
- **Open decisions** - Community input valued

### Serve Wellbeing

- **Welcoming community** - Follow [Code of Conduct](code-of-conduct.md)
- **No pressure** - Contribute at your own pace
- **Maintainer sustainability** - Reasonable expectations
- **Healthy boundaries** - It's okay to say no

## ❓ Questions?

**Contributing process:**
- Check this guide first
- Search [Discussions](https://github.com/orgs/Luminous-Dynamics/discussions)
- Ask in Discord #contributing
- Email: contribute@luminousdynamics.org

**Technical questions:**
- Post in appropriate Discord channel
- Start a GitHub Discussion
- Check documentation

**Code of Conduct issues:**
- Email: conduct@luminousdynamics.org
- See [Code of Conduct](code-of-conduct.md)

## 📚 Resources

### Internal

- [Code of Conduct](code-of-conduct.md)
- [Support Guide](support.md)
- [Philosophy](../philosophy/index.md)
- [Luminous Nix Docs](../luminous-nix/index.md)
- [Terra Lumina Docs](../terra-lumina/index.md)

### External

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)

---

## Thank You! 💜

Every contribution, no matter how small, helps build technology that serves human consciousness rather than exploits it.

Together, we're proving another way is possible.

*Last updated: November 14, 2025*

---

Ready to contribute? [Find a good first issue →](https://github.com/search?q=org%3ALuminous-Dynamics+label%3A%22good+first+issue%22+state%3Aopen&type=issues)
