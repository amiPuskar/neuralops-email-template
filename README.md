# NeuralOps Email Template Collection

A collection of professional email templates for NeuralOps, featuring responsive design and modern styling.

## 🚀 Quick Start

### Prerequisites

- [Node.js](https://nodejs.org/) (v14 or higher)
- [Yarn](https://yarnpkg.com/) package manager

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd NeuralOps-email-template
```

2. Install dependencies:
```bash
yarn install
```

### Running Locally

Start the development server:

```bash
yarn dev
```

or

```bash
yarn start
```

The server will start on `http://localhost:3000` and automatically open in your browser.

### Preview Mode

To run without auto-opening the browser:

```bash
yarn preview
```

## 📧 Available Templates

The project includes the following email templates:

1. **Workflow Summary** (`emails/check_workflow_Summary.html`)
   - Daily Ops Check Workflow Summary Template

2. **Workflow Summary (Backup)** (`emails/check_workflow_Summary_backup.html`)
   - Backup version of the Workflow Summary Template

Access all templates through the main index page at `http://localhost:3000`.

## 🌐 Deployment

### Deploy to Vercel

This project is configured for easy deployment on [Vercel](https://vercel.com/):

1. **Push your code to a Git repository** (GitHub, GitLab, or Bitbucket)

2. **Import to Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Click "New Project"
   - Import your Git repository
   - Vercel will automatically detect the configuration

3. **Deploy:**
   - Vercel will automatically deploy your project
   - Your site will be live at `https://your-project.vercel.app`

The `vercel.json` configuration file includes:
- Root route rewrites to serve `index.html`
- Security headers for production

## 📁 Project Structure

```
NeuralOps-email-template/
├── index.html              # Main landing page with template navigation
├── emails/                 # Email templates directory
│   ├── check_workflow_Summary.html
│   └── check_workflow_Summary_backup.html
├── package.json            # Project dependencies and scripts
├── vercel.json             # Vercel deployment configuration
├── .gitignore             # Git ignore rules
├── mcp.json               # MCP server configuration
├── FIGMA_SETUP.md         # Figma setup documentation
├── MCP_SETUP.md           # MCP setup documentation
├── setup-mcp.ps1          # Windows MCP setup script
├── setup-mcp.sh           # Unix MCP setup script
└── README.md              # This file
```

## 🛠️ Technologies

- **HTML5** - Email template markup
- **CSS3** - Styling and responsive design
- **Node.js** - Development server
- **http-server** - Static file server for local development
- **Vercel** - Hosting and deployment platform

## 📝 Scripts

- `yarn dev` - Start development server on port 3000 with auto-open
- `yarn start` - Alias for `yarn dev`
- `yarn preview` - Start development server without auto-opening browser

## 🔧 Development

### Adding New Templates

1. Create a new HTML file in the `emails/` directory
2. Add a button link in `index.html` to navigate to your new template (use `/emails/your-template.html`)
3. Follow the existing email template structure for consistency

### Local Development Tips

- The server runs on port 3000 by default
- Changes to HTML files are reflected immediately (no build step required)
- Use browser DevTools to test email client compatibility

## 📄 License

MIT License - see LICENSE file for details

## 👥 Author

NeuralOps

---

For questions or support, please contact the NeuralOps team.

