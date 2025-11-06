# MCP Servers Setup Guide

This project uses Model Context Protocol (MCP) servers to enhance AI capabilities in Cursor.

## Configuration

The MCP servers are configured in `mcp.json`. To use this configuration:

### For Cursor IDE

#### Option 1: Automated Setup (Recommended)

Run the setup script for your platform:

**Windows (PowerShell):**
```powershell
.\setup-mcp.ps1
```

**macOS/Linux (Bash):**
```bash
chmod +x setup-mcp.sh
./setup-mcp.sh
```

The script will:
- Check Node.js installation
- Backup existing MCP configuration
- Copy the project `mcp.json` to your Cursor settings directory
- Provide next steps

#### Option 2: Manual Setup

1. Copy the `mcp.json` file to your Cursor settings directory:
   - **Windows**: `C:\Users\{YourUsername}\.cursor\mcp.json`
   - **macOS**: `~/.cursor/mcp.json`
   - **Linux**: `~/.cursor/mcp.json`

2. Or use the project-local configuration if supported by your Cursor version.

3. Restart Cursor IDE to apply the changes.

## Configured Servers

### 1. Figma Desktop MCP Server
- **Name**: `figma-desktop`
- **URL**: `http://127.0.0.1:3845/mcp`
- **Purpose**: Access Figma designs through the Figma desktop app
- **Requirements**:
  - Figma desktop app installed and running
  - Open a Figma design file
  - Enable Dev Mode (`Shift + D`)
  - Click "Enable desktop MCP server" in the inspect panel
- **Best for**: Local development with Figma desktop app

### 2. Figma Remote MCP Server
- **Name**: `figma-remote`
- **URL**: `https://mcp.figma.com/mcp`
- **Purpose**: Access Figma designs through Figma's hosted endpoint
- **Requirements**:
  - Figma account authentication (will prompt when first used)
- **Best for**: Using Figma in the browser

**Note**: You can use either server, or both. The desktop server requires the Figma app to be running, while the remote server works with the browser version.

## Setup Requirements

### For Figma Desktop Server:
- **Figma Desktop App**: Latest version installed
- **Dev Mode Access**: Available in Figma desktop app

### For Figma Remote Server:
- **Figma Account**: Valid Figma account for authentication
- **Internet Connection**: Required to connect to Figma's hosted endpoint

## Customization

### Adding More Servers

You can add additional MCP servers by adding entries to the `mcpServers` object:

```json
{
  "mcpServers": {
    "server-name": {
      "command": "npx",
      "args": ["-y", "@package/name"],
      "env": {
        "ENV_VAR": "value"
      }
    }
  }
}
```

### Environment Variables

For sensitive data like API keys, consider using environment variables:

1. Create a `.env` file (add to `.gitignore`)
2. Reference it in the `env` section of the server configuration

## Troubleshooting

### Figma Desktop Server Issues:
- **"Connection refused" error**: 
  - Ensure Figma desktop app is running
  - Open a Figma design file
  - Enable Dev Mode (`Shift + D`)
  - Click "Enable desktop MCP server" in the right panel
  - Verify the server is running at `http://127.0.0.1:3845/mcp`

- **Server not found**:
  - Update Figma desktop app to the latest version
  - Restart Figma desktop app
  - Try disabling and re-enabling the desktop MCP server

### Figma Remote Server Issues:
- **Authentication errors**: 
  - Follow the authentication prompt when first connecting
  - Ensure you have a valid Figma account
  - Check your internet connection

- **Connection timeout**:
  - Verify you can access `https://mcp.figma.com` in your browser
  - Check firewall/proxy settings

## Resources

- [MCP Documentation](https://modelcontextprotocol.io)
- [Cursor MCP Setup](https://cursor.sh/docs/mcp)

