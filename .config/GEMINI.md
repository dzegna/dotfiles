# GEMINI.md

This file provides guidance to Gemini when working with code in this repository.

## Overview

This is a macOS user configuration directory (`~/.config`) containing settings and extensions for multiple development and productivity tools. The codebase is primarily configuration-based with compiled TypeScript/JavaScript extensions.

## Directory Structure

```
.config/
├── fish/           # Fish shell configuration
├── karabiner/      # Keyboard remapping (Caps Lock → Cmd+Ctrl+Opt)
├── opencode/       # OpenCode AI plugin environment (Bun-based)
└── raycast/        # Raycast launcher with 42+ extensions
```

## Key Technologies

- **Languages**: TypeScript, JavaScript, JSON, TOML, Shell (Fish), AppleScript
- **Runtimes**: Bun (for OpenCode), Node.js (for Raycast)
- **Frameworks**: Raycast API (@raycast/api), React
- **Build Tools**: Raycast CLI (`ray`), npm, Bun

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
├── tools/                    # AI integration tools
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

## Fish Shell Configuration

Configuration file: `fish/config.fish`

This file initializes the shell environment.

## Karabiner Keyboard Remapping

Configuration file: `karabiner/karabiner.json`

Current mapping:
- **Caps Lock** → **Command + Control + Option** (combined modifier key)

## AeroSpace Configuration

Configuration file: `aerospace/aerospace.toml`

This file configures the AeroSpace window manager, including keybindings, gaps, and layouts.

## Important Notes

### Security Considerations

- **Raycast API Tokens**: Stored in `raycast/config.json` (plaintext)
- **OpenAI API Keys**: May be stored in ChatGPT extension preferences
- Never commit or expose these files publicly

### Platform-Specific

This configuration is **macOS-only**. Tools like Karabiner-Elements, AeroSpace, and Raycast are not available on other platforms.

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
