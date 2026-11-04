#!/bin/sh
# CLI commands for the EL7.AI MCP server. Run the lines for your client; do not run this whole file.

# Claude Code (current project)
claude mcp add --transport http el7 https://mcp.el7.ai/mcp
# Claude Code (every project)
claude mcp add --transport http el7 --scope user https://mcp.el7.ai/mcp
# then sign in: /mcp inside Claude Code, or:
claude mcp login el7

# Codex
codex mcp add el7 --url https://mcp.el7.ai/mcp
codex mcp login el7

# VS Code
code --add-mcp '{"name":"el7","type":"http","url":"https://mcp.el7.ai/mcp"}'

# Goose (interactive: Add Extension > Remote Extension (Streamable HTTP))
goose configure
