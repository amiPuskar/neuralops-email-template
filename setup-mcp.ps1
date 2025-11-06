# MCP Servers Setup Script for NeuralOps Email Template (PowerShell)
# This script helps set up MCP servers configuration for Cursor IDE on Windows

Write-Host "🚀 Setting up MCP Servers for NeuralOps Email Template..." -ForegroundColor Cyan

# Set Cursor config path for Windows
$CURSOR_CONFIG_DIR = "$env:USERPROFILE\.cursor"
$CURSOR_CONFIG_FILE = "$CURSOR_CONFIG_DIR\mcp.json"

# Get project directory
$PROJECT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROJECT_MCP_FILE = Join-Path $PROJECT_DIR "mcp.json"

# Check if Node.js is installed
try {
    $nodeVersion = node -v
    Write-Host "✅ Node.js version: $nodeVersion" -ForegroundColor Green
    
    $majorVersion = [int]($nodeVersion -replace 'v(\d+)\..*', '$1')
    if ($majorVersion -lt 18) {
        Write-Host "⚠️  Warning: Node.js version is less than 18. Some MCP servers may not work correctly." -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Node.js is not installed. Please install Node.js 18+ from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Check if project mcp.json exists
if (-not (Test-Path $PROJECT_MCP_FILE)) {
    Write-Host "❌ Project mcp.json not found at $PROJECT_MCP_FILE" -ForegroundColor Red
    exit 1
}

Write-Host "📄 Found project mcp.json" -ForegroundColor Green

# Create Cursor config directory if it doesn't exist
if (-not (Test-Path $CURSOR_CONFIG_DIR)) {
    Write-Host "📁 Creating Cursor config directory: $CURSOR_CONFIG_DIR" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $CURSOR_CONFIG_DIR -Force | Out-Null
}

# Backup existing config if it exists
if (Test-Path $CURSOR_CONFIG_FILE) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $BACKUP_FILE = "${CURSOR_CONFIG_FILE}.backup.$timestamp"
    Write-Host "💾 Backing up existing config to: $BACKUP_FILE" -ForegroundColor Yellow
    Copy-Item $CURSOR_CONFIG_FILE $BACKUP_FILE
}

# Copy project mcp.json to Cursor config
Write-Host "📋 Copying MCP configuration to Cursor..." -ForegroundColor Cyan
Copy-Item $PROJECT_MCP_FILE $CURSOR_CONFIG_FILE

Write-Host ""
Write-Host "✅ MCP configuration installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Restart Cursor IDE to apply the changes"
Write-Host "   2. Verify the MCP servers are working in Cursor"
Write-Host ""
Write-Host "📖 For more information, see MCP_SETUP.md" -ForegroundColor Cyan

