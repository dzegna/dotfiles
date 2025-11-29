# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a macOS user configuration directory (`~/.config`) containing settings and extensions for multiple development and productivity tools. The codebase is primarily configuration-based with compiled TypeScript/JavaScript extensions.

## Directory Structure

```
.config/
├── aerospace/      # AeroSpace tiling window manager (i3-like for macOS)
├── fish/           # Fish shell configuration
├── karabiner/      # Keyboard remapping (Caps Lock → Cmd+Ctrl+Opt)
├── nvim/           # NvChad-based Neovim configuration
├── opencode/       # OpenCode AI plugin environment (Bun-based)
└── raycast/        # Raycast launcher with 42+ extensions
```

## Key Technologies

- **Languages**: TypeScript, JavaScript, Lua, JSON, Shell (Fish), AppleScript, TOML
- **Runtimes**: Bun (for OpenCode), Node.js (for Raycast), Neovim
- **Frameworks**: Raycast API (@raycast/api), React, NvChad
- **Build Tools**: Raycast CLI (`ray`), npm, Bun, stylua

## Raycast Extensions Development

### Build Commands

All Raycast extensions follow a standard command structure:

```bash
# Navigate to extension directory first
cd raycast/extensions/<extension-uuid>/

# Development mode (hot reload)
npm run dev
# or: ray develop

# Build for production
npm run build
# or: ray build -e dist

# Lint code
npm run lint
# or: ray lint

# Auto-fix linting issues
npm run fix-lint
# or: ray lint --fix

# Publish extension
npm run publish
# or: ray publish
```

### Extension Architecture

Each extension in `raycast/extensions/` follows this structure:

```
<extension-uuid>/
├── package.json              # Raycast extension manifest
├── index.js                  # Compiled entry point
├── [command-name].js         # Individual command handlers (compiled)
├── tools/                    # AI integration tools (for Claude/LLM)
│   └── [tool-name].js
└── assets/                   # Icons, images, AppleScripts
```

**Important**: Extensions contain **compiled** JavaScript. Source TypeScript files are NOT present in this directory. Modifications should be made to source files (if available) and then rebuilt.

### Extension Configuration

Extension metadata is in `package.json`:
- `name`, `title`, `description` - Extension identity
- `commands[]` - List of available commands with names, descriptions, and modes
- `preferences[]` - User-configurable settings
- `dependencies` - Always includes `@raycast/api` (v1.31+) and `@raycast/utils`

### AI Tools Integration

Several extensions implement AI tools for Claude integration. These are found in the `tools/` directory and follow the Raycast AI tools API.

Example extensions with AI tools:
- **Apple Reminders**: 8 tools (create/update/delete reminders/lists, get reminders/lists)
- **Toothpick**: 3 tools (get Bluetooth devices, connect/disconnect)

## OpenCode AI Plugin

Located in `opencode/` directory.

### Commands

```bash
cd opencode/

# Install dependencies
bun install

# Development (if applicable)
bun run dev

# Build (if applicable)
bun run build
```

### Dependencies

- `@opencode-ai/plugin` v1.0.65 - Main plugin framework
- `@opencode-ai/sdk` v1.0.65 (dev) - Development SDK
- `zod` v4.1.8 - Schema validation

**Note**: This environment uses Bun as the runtime, which is faster than Node.js.

## AeroSpace Tiling Window Manager

Configuration file: `aerospace/aerospace.toml`

AeroSpace is an i3-like tiling window manager for macOS. Key configuration details:

### Window Management
- **Navigation**: Alt+h/j/k/l (vim-style focus movement)
- **Moving windows**: Alt+Shift+h/j/k/l
- **Workspaces**: Alt+1-9 and Alt+a-z for named workspaces
- **Layouts**: Alt+/ for tiles, Alt+, for accordion

### Workspace Auto-Assignment
Windows are automatically assigned to specific workspaces based on app-id:
- Workspace 1: Zen Browser
- Workspace A: ChatGPT
- Workspace B: Chrome Canary
- Workspace E: Spark (email)
- Workspace F: Finder, AppCleaner
- Workspace P: Photoshop
- Workspace V: VSCode Insiders, Warp
- Workspace W: WhatsApp
- Workspace Y: Wyze Cam

### Floating Apps
Some apps default to floating layout: Perplexity, Claude Desktop, App Store, Activity Monitor, Shottr, Fantastical

### Integration
- Starts JankyBorders on launch (white active border, 4px width)
- Mouse follows focus automatically
- Service mode (Alt+Shift+;) for advanced operations like reloading config, flattening workspace tree, toggling floating/tiling

## Neovim (NvChad) Configuration

Located in `nvim/` directory. This is a **git repository** (unlike other config directories).

### Architecture
- **Core modules**: `lua/nvchad/` contains options, mappings, autocmds, and plugin specs
- **Plugin configurations**: `lua/nvchad/configs/<plugin>.lua` for per-plugin settings
- **Base NvChad**: Imported as a plugin via Lazy.nvim, uses [starter config pattern](https://github.com/nvchad/starter)

### Development Commands

```bash
cd nvim/

# Sync plugin dependencies after changing specs
nvim --headless "+Lazy! sync" +qa

# Run health check (treesitter, LSP, clipboard)
nvim --headless "+checkhealth" +qa

# Format all Lua files (required before commits)
stylua .

# Test with isolated environment (won't affect stable setup)
NVIM_APPNAME=nvchad-dev nvim
```

### Key Conventions
- **Lua only**: All config in Lua, formatted with stylua (2-space indents, 120 cols, double quotes)
- **Lazy loading**: 93% of plugins load on-demand via events/commands for fast startup (~0.02-0.07s)
- **Module pattern**: Config files return tables/functions, avoid globals
- **Keymaps**: Use `vim.keymap.set` with `desc` metadata for discoverability
- **Autocommands**: Use `Nv*` augroup pattern, respect lazy-loading (trigger after `User FilePost`)

### Plugin Stack
Key plugins: nvim-tree (file explorer), telescope (fuzzy finder), nvim-lspconfig + mason (LSP), nvim-cmp (completion), nvim-treesitter (syntax), gitsigns, indent-blankline, which-key

### Testing Checklist
When modifying nvim config:
1. Open nvim and check for startup errors
2. Trigger relevant events (LSP attach, tree toggle, completion)
3. Run `:TSUpdate` after Treesitter changes
4. Verify `:WhichKey` entries after keymap changes
5. Test theme switching and UI modules (statusline/tabufline)

### Important Notes
- **Branch**: Base work on `v2.5` branch if contributing
- **Source files only**: Don't commit base46 cache or Lazy state
- **Compiled output**: NvChad is imported as plugin; local changes in `lua/nvchad/` are configuration, not core edits

## Fish Shell Configuration

Configuration file: `fish/config.fish`

This file initializes the shell environment and sets up Conda/Anaconda for Python development. Modifications to PATH or environment variables should be added here.

## Karabiner Keyboard Remapping

Configuration file: `karabiner/karabiner.json`

Current mapping:
- **Caps Lock** → **Command + Control + Option** (combined modifier key)

Automatic backups are stored in `karabiner/automatic_backups/` with date stamps.

To modify keyboard mappings, edit `karabiner.json` directly. The Karabiner-Elements GUI can also be used, which will update this file automatically.

## Important Notes

### Security Considerations

- **Raycast API Tokens**: Stored in `raycast/config.json` (plaintext)
- **OpenAI API Keys**: May be stored in ChatGPT extension preferences
- Never commit or expose these files publicly

### Platform-Specific

This configuration is **macOS-only**. Tools like Karabiner-Elements and Raycast are not available on other platforms.

### No Version Control

This directory is not a Git repository. Changes are configuration updates, not code commits.

### Compiled Extensions

Raycast extensions are pre-compiled. To modify extension behavior:
1. Locate the source TypeScript files (likely in a separate development directory)
2. Make changes to source
3. Rebuild using `ray build`
4. Compiled output will update in this directory

### Extension IDs

Raycast extensions use UUID-based directory names. To identify an extension:
- Check `package.json` → `title` or `name` field
- Example: `7c158f0e-b70b-4922-8a1b-5c8a9ccb55d6` = "Image Modification"
