# Keyboard Shortcuts & Tips

**Navigate documentation faster with keyboard shortcuts and power user tips.**

---

## Documentation Navigation

### Material for MkDocs Shortcuts

| Shortcut | Action |
|----------|--------|
| **F** or **/** | Open search |
| **Esc** | Close search / dialogs |
| **Enter** | Follow search result |
| **Arrow Keys** | Navigate search results |
| **Tab** | Navigate through interactive elements |
| **Shift + Tab** | Navigate backwards |

### Browser Shortcuts

| Shortcut | Action |
|----------|--------|
| **Ctrl/Cmd + F** | Find in page |
| **Ctrl/Cmd + P** | Print / Save as PDF |
| **Ctrl/Cmd + D** | Bookmark page |
| **Ctrl/Cmd + T** | New tab |
| **Ctrl/Cmd + W** | Close tab |
| **Ctrl/Cmd + Click** | Open link in new tab |
| **Alt + Left Arrow** | Back |
| **Alt + Right Arrow** | Forward |

### Reading Mode

**Chrome:**
- Press `F11` for fullscreen
- Use Reader View extension

**Firefox:**
- Press `F9` for Reader View
- Or click reader icon in address bar

**Safari:**
- Press `Cmd + Shift + R` for Reader View

---

## Command Line Shortcuts (Luminous Nix)

### Bash/Terminal Basics

| Shortcut | Action |
|----------|--------|
| **Ctrl + C** | Cancel current command |
| **Ctrl + D** | Exit terminal / End input |
| **Ctrl + L** | Clear screen |
| **Ctrl + R** | Search command history |
| **Ctrl + A** | Move to line start |
| **Ctrl + E** | Move to line end |
| **Ctrl + U** | Clear line before cursor |
| **Ctrl + K** | Clear line after cursor |
| **Tab** | Auto-complete |
| **Up/Down arrows** | Navigate command history |

### Luminous Nix Specific

| Command | Shortcut/Alias |
|---------|----------------|
| `ask-nix` | Create alias: `alias an='ask-nix'` |
| Quote commands | Use `"` for multi-word requests |
| Rollback quickly | `ask-nix rollback` |
| System info | `ask-nix sysinfo` (if aliased) |

**Recommended aliases** (add to `~/.bashrc` or `~/.zshrc`):

```bash
# Luminous Nix shortcuts
alias an='ask-nix'
alias ani='ask-nix install'
alias anr='ask-nix remove'
alias anu='ask-nix update'
alias anrb='ask-nix rollback'

# Common requests
alias dev='ask-nix "show development environment status"'
alias sysinfo='ask-nix "show detailed system information"'
```

---

## Voice Interface Shortcuts

### Wake Words

**Default:** "Hey Nix"

**Custom wake words** (in config.yaml):
```yaml
voice:
  wake_word: "Computer"  # Star Trek style
  # or "Jarvis", "Assistant", etc.
```

### Voice Commands Tips

**Clear pronunciation:**
- Speak at normal pace (not too fast)
- Pause slightly between wake word and command
- Be specific about what you want

**Confirmation shortcuts:**
- "Yes" or "Yeah" or "Yep" or "Sure" or "OK"
- "No" or "Nope" or "Cancel" or "Stop"

**Common voice patterns:**
```
"Hey Nix, install [package]"
"Hey Nix, show me [information]"
"Hey Nix, enable [service]"
"Hey Nix, what's using [resource]"
```

---

## Documentation Power Tips

### Quick Navigation Tricks

**1. Use the search intelligently:**
- Search for concepts, not exact words
- Try multiple search terms
- Use quotes for exact phrases: `"regenerative exit"`

**2. Bookmark frequently used pages:**
```
Most visited:
- Quick Reference: docs.luminousdynamics.org/quick-reference/
- Getting Started: docs.luminousdynamics.org/getting-started/
- Troubleshooting: docs.luminousdynamics.org/troubleshooting/
- Your product's FAQ
```

**3. Use browser's address bar:**
Type `docs.luminousdynamics.org` then `Tab` to search directly (if supported)

**4. Right-click > Open in new tab:**
Keep current page while exploring links

### Speed Reading

**For quick scanning:**
1. Read page title and introduction
2. Scan all headings
3. Read code examples
4. Jump to sections that interest you

**For deep understanding:**
1. Read beginning to end
2. Try code examples yourself
3. Follow all "See also" links
4. Take notes in your own words

### Copy Code Blocks

**Material theme includes copy button:**
- Hover over code block
- Click copy icon (appears top-right)
- Paste into terminal

**Or manually:**
- Triple-click to select entire code block
- `Ctrl/Cmd + C` to copy

---

## Productivity Shortcuts

### Multi-Window Setup

**Recommended layout for learning:**

```
┌─────────────┬─────────────┐
│             │             │
│ Docs        │ Terminal    │
│ (Browser)   │ (Try cmds)  │
│             │             │
├─────────────┴─────────────┤
│                           │
│ Text Editor / IDE         │
│ (Take notes)              │
│                           │
└───────────────────────────┘
```

**Shortcuts to arrange windows:**
- Windows: `Win + Arrow keys`
- macOS: Use Rectangle app or Magnet
- Linux: `Super + Arrow keys` (many DEs)

### Note-Taking Tips

**While reading docs:**
- Keep a "commands to try" list
- Note page URLs for later
- Copy-paste examples with attribution
- Create your own cheat sheet

**Markdown format:**
```markdown
# Luminous Nix Notes

## Common Commands
- `ask-nix "install docker"` - Install Docker
- Source: docs.luminousdynamics.org/quick-reference/

## To Try
- [ ] Set up voice interface
- [ ] Create dev environment
- [ ] Try rollback feature

## Questions
- How does multi-step workflow work?
  Link: docs.luminousdynamics.org/advanced-use-cases/
```

---

## Terra Lumina Shortcuts

### Website Navigation

**Quick access:**
- Projects: `terralumina.org/projects`
- Portfolio: `terralumina.org/portfolio`
- Account: `terralumina.org/account`

**Bookmark these:**
- Dashboard: Your daily check
- Project filters: Your search criteria
- Favorite projects: For monitoring

### Investment Workflow Shortcuts

**Use browser password manager:**
- Save login credentials securely
- Use strong, unique password
- Enable 2FA for security

**Excel/Sheets formulas for tracking:**

```excel
# Expected annual return
=INVESTMENT_AMOUNT * RETURN_RATE

# Total return over 10 years (no compounding)
=INVESTMENT_AMOUNT * (1 + (RETURN_RATE * 10))

# Portfolio allocation percentage
=PROJECT_AMOUNT / TOTAL_PORTFOLIO
```

**Example tracker:**
```
Project A: $100 @ 10% = $10/year = $100 over 10 years
Project B: $150 @ 8% = $12/year = $120 over 10 years
Total invested: $250
Expected total return: $220
```

---

## Advanced Tips

### URL Parameters (if supported)

**Jump directly to sections:**
```
docs.luminousdynamics.org/page/#section-name
```

**Search from URL:**
```
docs.luminousdynamics.org/?q=search+term
```

### Browser Extensions

**Recommended for documentation:**

**General:**
- Dark Reader (dark mode for any site)
- OneTab (manage many open doc tabs)
- Grammarly (if contributing to docs)

**For developers:**
- JSON Viewer (for API documentation)
- Markdown Here (for note-taking)
- GoFullPage (screenshot entire doc pages)

### Print to PDF Settings

**Best settings for saving docs as PDF:**

1. **Paper size:** A4 or Letter
2. **Orientation:** Portrait (or Landscape for wide tables)
3. **Margins:** Default or Narrow
4. **Background graphics:** ON (to keep colors)
5. **Headers/Footers:** OFF (cleaner look)

**Pages to save as PDF:**
- [Printable Quick Reference](printable-quick-reference.md)
- [Decision Trees](decision-trees.md)
- [Comparison Matrices](comparison-matrices.md)
- Product-specific quick starts

---

## Mobile Shortcuts

### Reading on Mobile

**iOS:**
- Reader View: Tap `aA` icon → "Show Reader View"
- Save for offline: Add to Reading List
- Share: Use Share Sheet

**Android:**
- Reader Mode: Tap menu → "Simplified View"
- Save for offline: Add to Home Screen
- Share: Use Android Share menu

### Mobile-Specific Tips

**For better reading:**
- Rotate to landscape for tables
- Pinch to zoom code blocks
- Use "Find in page" for searching
- Enable dark mode (easier on eyes)

**Saving for offline:**
1. Open page in browser
2. Add to Reading List / Save offline
3. Access later without internet

---

## Accessibility Shortcuts

### Screen Readers

**Common shortcuts:**
- `H` - Next heading
- `K` - Next link
- `Tab` - Next interactive element
- `Insert + F7` (NVDA) - Elements list
- `Ctrl + Option + U` (VoiceOver) - Web rotor

### High Contrast Mode

**Windows:**
- `Left Alt + Left Shift + Print Screen`

**macOS:**
- System Preferences → Accessibility → Display → Increase Contrast

**Linux:**
- Varies by desktop environment

### Text Size

**Browser zoom:**
- `Ctrl/Cmd + +` - Zoom in
- `Ctrl/Cmd + -` - Zoom out
- `Ctrl/Cmd + 0` - Reset zoom

**Material theme adapts well to zoom levels**

---

## Keyboard Shortcuts Cheat Sheet

**Print this table:**

| Context | Shortcut | Action |
|---------|----------|--------|
| **Docs** | `/` or `F` | Search |
| **Docs** | `Esc` | Close search |
| **Docs** | `Tab` | Navigate elements |
| **Browser** | `Ctrl/Cmd + F` | Find in page |
| **Browser** | `Ctrl/Cmd + P` | Print / PDF |
| **Terminal** | `Ctrl + C` | Cancel command |
| **Terminal** | `Ctrl + R` | Search history |
| **Terminal** | `Tab` | Auto-complete |
| **Voice** | "Hey Nix" | Wake up Luminous Nix |
| **Voice** | "Yes/No" | Confirm/Cancel |
| **System** | `Win/Cmd + D` | Show desktop |
| **System** | `Alt + Tab` | Switch apps |

---

## Pro Tips Summary

### For Fastest Learning

1. **Bookmark top 5 pages** you use most
2. **Create aliases** for common commands
3. **Use search liberally** - it's fast and good
4. **Open links in new tabs** to not lose your place
5. **Take notes** in your own words

### For Best Experience

1. **Use dark mode** (Material theme supports it)
2. **Zoom to comfortable size** (Ctrl/Cmd +/-)
3. **Enable reader view** for long pages
4. **Print important references** to PDF
5. **Join Discord** for real-time help

### For Contributing

1. **Use browser dev tools** to inspect issues
2. **Screenshot** problems you find
3. **Copy exact URLs** when reporting
4. **Test on mobile** if relevant
5. **Follow style guide** when writing

---

## Custom Shortcuts You Can Create

### Create Browser Bookmarklets

**Quick search bookmarklet:**
```javascript
javascript:(function(){var q=prompt('Search Luminous Docs:');if(q){window.location='https://docs.luminousdynamics.org/?q='+encodeURIComponent(q);}})();
```

Save as bookmark, click to quick search.

### Custom Search Engines

**Chrome/Edge:**
1. Settings → Search Engines → Manage
2. Add new:
   - Name: `Luminous Docs`
   - Keyword: `ld` or `docs`
   - URL: `https://docs.luminousdynamics.org/?q=%s`
3. Use: Type `ld` in address bar, then search term

**Firefox:**
1. Visit docs.luminousdynamics.org
2. Right-click search box
3. "Add a Keyword for this Search"
4. Use keyword in address bar

---

## Questions?

**Can't find a shortcut?**
- Ask in Discord: discord.gg/luminous
- Check browser's help: `Ctrl/Cmd + ?`
- See terminal man page: `man bash`

**Want to suggest new shortcuts?**
- Open issue: github.com/Luminous-Dynamics/docs/issues
- Discuss: github.com/orgs/Luminous-Dynamics/discussions
- Email: docs@luminousdynamics.org

---

*Remember: Shortcuts are meant to help, not hinder. Use what works for you!*

**Made with 💜 by humans who believe efficiency should serve, not stress**

*Last updated: November 16, 2025*
