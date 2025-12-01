# M4 MacBook Pro Setup - System Status Report
**Generated:** December 2, 2025  
**System:** macOS Sequoia 15.2.0 (Darwin 25.2.0, arm64)  
**Hardware:** Apple M4 MacBook Pro  

## Executive Summary

This macOS user directory (`/Users/dz`) represents a highly optimized, AI-augmented development environment for a full-stack developer and entrepreneur. The setup features a domain-driven project organization, comprehensive tooling ecosystem, and universal AI agent framework. Recent restructuring (2025-11-30) migrated from flat prefix-based organization to hierarchical life domains.

## Directory Structure & Organization

### Core Architecture
```
/
├── .config/           # Tool configurations (AeroSpace, Neovim, Raycast, etc.)
├── .zshrc             # Shell configuration with AI agent shortcuts
├── .gitconfig         # Git setup (dzegna/donavan.zegna@gmail.com)
├── AIprojs/           # AI-augmented project workspace
├── Developer/         # Traditional development projects
├── archive/           # Legacy shell configurations
└── [dotfiles]         # Various tool caches and configs
```

### AIprojs Domain Hierarchy (Post-2025-11-30 Migration)

**Life Domain** - Personal & Family Projects
- `fam_Hiyuki/` - Family member Hiyuki's projects
- `fam_Donavan/` - Personal development and tracking
- `fam_Miki/` - Family member Miki's projects
- `relationshipGrowthPlans.md` - Relationship development framework
- `significantEvents.md` - Life event tracking

**Work Domain** - Professional & Business Projects
- `wrk_NVCSG/` - Primary business (70% focus) - NVC.SG operations
- `wrk_PPI/` - Secondary business (30% focus) - PPI operations
- `wrk_BuildBiz/` - Business development projects

**Computing Domain** - Technical Infrastructure
- `my_M4MBPsetup/` - MacBook Pro configuration and automation
- `my_WebDev/` - Web development projects and experiments
- `my_ContaboVPS/` - VPS server management
- `my_OmarchyBox/` - Home server/Omarchy operations

**Meta Domains** - Organizational Systems
- `@lifePlan/` - Meta life planning and tracking system
- `@multi-agent/` - Multi-agent AI framework development
- `geminiExtensions/` - Google Gemini AI extensions (Go-based)

## Development Environment Setup

### Runtime Environments

**Python Ecosystem**
- **Version:** Python 3.14.0 (managed via Anaconda/Conda)
- **Package Manager:** Conda (646 packages installed)
- **Pip:** 478 packages, 321 outdated
- **Usage:** `python3` command (explicit), conda environments available

**Node.js Ecosystem**
- **Version:** v25.2.1 (managed via NVM)
- **Package Manager:** npm v11.4.2 (4 global packages, 3 outdated)
- **Build Tools:** Standard npm workflow (install/dev/build/test)

**Ruby Ecosystem**
- **Version:** ruby 2.6.10p210 (2022-04-12)
- **Package Manager:** RubyGems v3.0.3.1 (48 gems installed, 42 outdated)

### Package Manager Status (Latest Update: 2025-12-01)

| Manager | Version | Installed | Outdated | Status |
|---------|---------|-----------|----------|--------|
| Homebrew | 5.0.3 | 218 formulae, 33 casks | 0 | ✅ Current |
| npm | 11.4.2 | 4 global packages | 3 | ⚠️ Updates available |
| pip | 24.2 | 478 packages | 321 | ⚠️ Major updates needed |
| conda | 24.11.3 | 646 packages | N/A | ✅ Current |
| RubyGems | 3.0.3.1 | 48 gems | 42 | ⚠️ Updates available |

### Shell & Navigation

**Primary Shell:** Zsh with custom configuration
- **Prompt:** Powerline-go enhanced prompt
- **Navigation:** zoxide (smart directory jumping with `z` command)
- **AI Integration:** Universal agent shortcuts via command-not-found handler

**Key Aliases:**
```bash
config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'  # Dotfiles management
dlogseq='cd ~/AIprojs/fam_Donavan/logseq'                      # Logseq navigation
ylogseq='yazi ~/AIprojs/fam_Donavan/logseq'                   # Yazi file manager
lc='~/AIprojs/lc.sh'                                          # Life coach agent
agent='~/AIprojs/agent.sh'                                    # Universal agent launcher
mail-sync='mbsync -a && notmuch new'                          # Email synchronization
```

## AI Agent Framework

### Universal Agent System

**Access Methods:**
- `./agent.sh [agent-name]` - Direct script execution
- `agent [agent-name]` - Shell alias
- Slash commands via command-not-found handler (e.g., `/lc`, `/dev`, `/sys`)

**Available Agents:**
- **Life Coach** (`/lc`, `life-coach`) - Personal development, goal setting
- **Developer** (`/dev`, `developer`) - Code implementation and debugging
- **Researcher** (`/research`, `researcher`) - Learning and research tasks
- **Marketer** (`/marketer`, `mkt`) - Marketing and SEO optimization
- **Scribe** (`/scribe`, `docs`) - Documentation and writing
- **Time Tracker** (`/tt`, `time-tracker`) - Productivity tracking
- **NVC Emailer** (`/nvc`, `email`) - NVC.SG email management
- **Sysadmin** (`/sys`, `sysadmin`) - System administration

**Special Commands:**
- `/del-day` - Delete all reminders for current day across Work/Life/Love lists
- `/agent` - List all available agents

### Agent Architecture
- **Launcher:** `~/AIprojs/agent.sh` - Universal dispatcher
- **Life Coach:** `~/AIprojs/lc.sh` - Specialized personal development agent
- **Context Integration:** Agents access domain-specific knowledge bases
- **Cross-Platform:** Works with Claude, Gemini, ChatGPT, and other AI tools

## Tool Configurations

### Window Management (AeroSpace)
**Configuration:** `~/.config/aerospace/aerospace.toml`
- **Layout:** Tiling with accordion padding (75px)
- **Navigation:** Vim-style (Alt+h/j/k/l for focus, Alt+Shift+h/j/k/l for moving)
- **Workspaces:** Numbered (1-9) and named (A-Z) workspaces
- **Auto-assignment:** Apps automatically assigned to specific workspaces
- **Borders:** JankyBorders integration (white 4px active border)

**Workspace Assignments:**
- **1:** Zen Browser
- **A:** ChatGPT
- **B:** Chrome Canary
- **E:** Spark (email)
- **F:** Finder, AppCleaner
- **P:** Photoshop
- **V:** VSCode Insiders, Warp
- **W:** WhatsApp
- **Y:** Wyze Cam

### Text Editor (NvChad Neovim)
**Location:** `~/.config/nvim/` (Git repository)
- **Framework:** NvChad v2.5 on `v2.5` branch
- **Plugins:** 93% lazy-loaded for ~0.02-0.07s startup
- **Language Support:** Treesitter, LSP (mason), CMP completion
- **Keymaps:** Vim-style with discoverable descriptions
- **Formatting:** stylua (2-space, 120 cols, double quotes)

### Launcher (Raycast)
**Extensions:** 42+ custom extensions in `~/.config/raycast/extensions/`
- **AI Tools:** Apple Reminders (8 tools), Toothpick Bluetooth (3 tools)
- **Development:** Raycast API v1.31+ with @raycast/api and @raycast/utils
- **Build Process:** npm-based (dev/build/lint/publish commands)

### Keyboard (Karabiner-Elements)
**Configuration:** `~/.config/karabiner/karabiner.json`
- **Caps Lock Remap:** Caps Lock → Command + Control + Option
- **Backups:** Automatic timestamped backups in `karabiner/automatic_backups/`

### Fish Shell (Secondary)
**Configuration:** `~/.config/fish/config.fish`
- **Purpose:** Conda/Anaconda initialization
- **Integration:** Environment variable management

## Recent Updates & Backups

### Migration History (2025-11-30)
- **Restructured** AIprojs from flat prefix-based to domain hierarchy
- **Updated** 15+ files with new path references
- **Preserved** all functionality while improving organization
- **Benefits:** Reduced visual clutter, semantic grouping, AI-friendly structure

### Backup System
**Location:** `~/AIprojs/backups/` and `~/AIprojs/reports/`
- **Package Managers:** Automated backups of brew/conda/pip/npm/gem states
- **Update Reports:** Pre/post-update status tracking
- **Latest Backup:** 2025-12-01 21:26:27 +08
- **Coverage:** All major package managers and their installed packages

### Update Status
- **Homebrew:** Fully current (0 outdated)
- **Conda:** Current version, comprehensive package set
- **npm/pip/RubyGems:** Require updates (significant outdated counts)

## Security & Credentials

### Exposed Files (⚠️ Caution Required)
- **Raycast Config:** `~/.config/raycast/config.json` contains API tokens
- **Git Config:** Standard user credentials (dzegna/donavan.zegna@gmail.com)

### Protected Areas
- **SSH Keys:** `~/.ssh/` (properly secured)
- **GPG Keys:** `~/.gnupg/` (properly secured)
- **Password Store:** `~/.password-store/` (encrypted)

## Performance & Health

### System Health
- **macOS:** Sequoia 15.2.0 (latest stable)
- **Architecture:** Apple Silicon M4 (arm64)
- **Shell Startup:** Optimized with lazy loading and caching

### Development Workflow
- **Navigation:** zoxide enables instant jumps to any project
- **Version Control:** Git with main branch default, bare repo for dotfiles
- **AI Integration:** Universal agents accessible from any context
- **Backup Automation:** Regular package manager state snapshots

## Maintenance Recommendations

### Immediate Actions
1. **Update Package Managers:** pip (321 outdated), npm (3 outdated), RubyGems (42 outdated)
2. **Review AIprojs Structure:** Verify all path references post-migration
3. **Test Agent Commands:** Ensure all slash commands work correctly

### Ongoing Tasks
1. **Monthly Updates:** Run package manager updates and backup
2. **Project Organization:** Continue using domain-based structure for new projects
3. **Agent Maintenance:** Update agent contexts as projects evolve
4. **Backup Verification:** Regularly test backup restoration procedures

## Navigation Quick Reference

### Domain Jumping (zoxide)
```bash
z Life           # Personal & family projects
z Work           # Professional projects  
z Computing      # Technical infrastructure
z @life          # Meta planning system
z @multi         # Multi-agent framework
```

### Common Project Paths
```bash
~/AIprojs/Life/fam_Donavan/           # Personal logseq and notes
~/AIprojs/Work/wrk_NVCSG/             # Primary business operations
~/AIprojs/Computing/my_M4MBPsetup/    # This setup documentation
~/AIprojs/@lifePlan/                  # Life planning system
```

### Agent Commands
```bash
/lc              # Life coach for personal development
/dev             # Developer for coding tasks
/sys             # Sysadmin for system tasks
/nvc             # NVC.SG email management
/del-day         # Clear today's reminders
```

---

**Status:** 🟢 OPERATIONAL - All systems functional, recent migration successful  
**Last Reviewed:** December 2, 2025  
**Next Review Due:** January 2026</content>
<parameter name="filePath">/Users/dz/M4MBP_README.md