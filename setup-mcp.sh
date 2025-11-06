#!/bin/bash

# MCP Servers Setup Script for NeuralOps Email Template
# This script helps set up MCP servers configuration for Cursor IDE

echo "🚀 Setting up MCP Servers for NeuralOps Email Template..."

# Detect OS and set Cursor config path
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows
    CURSOR_CONFIG_DIR="$HOME/.cursor"
    CURSOR_CONFIG_FILE="$CURSOR_CONFIG_DIR/mcp.json"
    echo "📁 Windows detected"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    CURSOR_CONFIG_DIR="$HOME/.cursor"
    CURSOR_CONFIG_FILE="$CURSOR_CONFIG_DIR/mcp.json"
    echo "📁 macOS detected"
else
    # Linux
    CURSOR_CONFIG_DIR="$HOME/.cursor"
    CURSOR_CONFIG_FILE="$CURSOR_CONFIG_DIR/mcp.json"
    echo "📁 Linux detected"
fi

# Get project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_MCP_FILE="$PROJECT_DIR/mcp.json"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ from https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "⚠️  Warning: Node.js version is less than 18. Some MCP servers may not work correctly."
fi

echo "✅ Node.js version: $(node -v)"

# Check if project mcp.json exists
if [ ! -f "$PROJECT_MCP_FILE" ]; then
    echo "❌ Project mcp.json not found at $PROJECT_MCP_FILE"
    exit 1
fi

echo "📄 Found project mcp.json"

# Create Cursor config directory if it doesn't exist
if [ ! -d "$CURSOR_CONFIG_DIR" ]; then
    echo "📁 Creating Cursor config directory: $CURSOR_CONFIG_DIR"
    mkdir -p "$CURSOR_CONFIG_DIR"
fi

# Backup existing config if it exists
if [ -f "$CURSOR_CONFIG_FILE" ]; then
    BACKUP_FILE="${CURSOR_CONFIG_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "💾 Backing up existing config to: $BACKUP_FILE"
    cp "$CURSOR_CONFIG_FILE" "$BACKUP_FILE"
fi

# Copy project mcp.json to Cursor config
echo "📋 Copying MCP configuration to Cursor..."
cp "$PROJECT_MCP_FILE" "$CURSOR_CONFIG_FILE"

echo "✅ MCP configuration installed successfully!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart Cursor IDE to apply the changes"
echo "   2. Verify the MCP servers are working in Cursor"
echo ""
echo "📖 For more information, see MCP_SETUP.md"

