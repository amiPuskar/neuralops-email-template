# Figma MCP Server Setup Guide

This guide explains how to set up and use the Figma MCP servers configured in this project.

## Quick Start

### Option 1: Figma Desktop Server (Recommended for Local Development)

1. **Install Figma Desktop App**
   - Download from [figma.com/downloads](https://www.figma.com/downloads/)
   - Install and log in to your Figma account

2. **Enable Desktop MCP Server**
   - Open the Figma desktop app
   - Open any Figma design file
   - Press `Shift + D` to enable Dev Mode (or click the toggle in the toolbar)
   - In the right-hand inspect panel, click **"Enable desktop MCP server"**
   - You should see a confirmation that the server is running at `http://127.0.0.1:3845/mcp`

3. **Verify in Cursor**
   - After running the setup script or manually copying `mcp.json` to Cursor settings
   - Restart Cursor IDE
   - The `figma-desktop` server should connect automatically

### Option 2: Figma Remote Server (Works with Browser)

1. **No Local Setup Required**
   - This server connects directly to Figma's hosted endpoint
   - Works with Figma in the browser (no desktop app needed)

2. **Authenticate**
   - When first using the remote server, Cursor will prompt you to authenticate
   - Follow the authentication flow to connect your Figma account

3. **Verify in Cursor**
   - After running the setup script or manually copying `mcp.json` to Cursor settings
   - Restart Cursor IDE
   - The `figma-remote` server should connect and prompt for authentication

## Which Server Should I Use?

- **Use `figma-desktop`** if:
  - You prefer the Figma desktop app
  - You're doing local development
  - You want faster access to local files

- **Use `figma-remote`** if:
  - You use Figma in the browser
  - You don't have the desktop app installed
  - You want to access files without opening the desktop app

- **Use both** if:
  - You switch between desktop and browser
  - You want redundancy

## Troubleshooting

### Desktop Server Not Connecting

**Error: "Connection refused" or "ECONNREFUSED"**

1. Check that Figma desktop app is running
2. Ensure Dev Mode is enabled (`Shift + D`)
3. Verify the MCP server is enabled in the inspect panel
4. Check that the server is running by visiting `http://127.0.0.1:3845/mcp` in your browser (you should see a response)

**Server not found in Dev Mode:**

1. Update Figma desktop app to the latest version
2. Restart Figma desktop app
3. Re-open your design file
4. Try disabling and re-enabling the desktop MCP server

### Remote Server Not Connecting

**Authentication fails:**

1. Ensure you have a valid Figma account
2. Check your internet connection
3. Try re-authenticating through Cursor's MCP settings

**Connection timeout:**

1. Verify you can access `https://mcp.figma.com` in your browser
2. Check firewall/proxy settings
3. Ensure your network allows HTTPS connections

## Using the Figma MCP Server

Once connected, you can use the Figma MCP server in Cursor to:

- Access Figma design files
- Get design tokens and styles
- Export assets
- View design specifications
- And more!

The AI assistant in Cursor can now access your Figma designs to help with email template development.

## Additional Resources

- [Figma Desktop MCP Server Documentation](https://help.figma.com/hc/en-us/articles/360061083214)
- [MCP Protocol Documentation](https://modelcontextprotocol.io)
- [Cursor MCP Setup Guide](https://cursor.sh/docs/mcp)

