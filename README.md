<p align="center"><img src="assets/icon.svg" width="72" height="72" alt="EL7.AI"></p>

# EL7.AI MCP server

Financial market intelligence and research for your AI.

[العربية](README.ar.md) · [Documentation](https://el7.ai/en/mcp) · [Tool reference](https://el7.ai/guides/mcp-tool-reference.html)

> **The EL7.AI server is a proprietary hosted service; this repository contains only connection configuration and documentation.** There is no server code here and nothing to install or run locally.

## What it is

EL7.AI is a financial market intelligence and research platform. Its MCP server gives your AI assistant 85 read-only tools across 15 areas of market research, so it can answer from curated, sourced data instead of guessing.

Coverage: real-time markets news and the EL7 Wire; the global economic calendar with history, consensus and surprise index; eight central banks (Fed, ECB, BoE, BoJ, BoC, RBA, RBNZ, SNB) with decisions, statements, statement-to-statement diffs, press-conference Q&A, previews and tone ranking; CFTC Commitments of Traders positioning; gold and oil fundamentals (flows, reserves, inventories, OPEC, supply and demand); stocks with scores, written analysis, rankings, screener, sector views, analyst consensus, earnings calendar and history, insider and congressional trades; ETFs; market regime, seasonality, correlations and cycles; prediction markets; trading strategies; and a research library. Built for a global audience: English first, with full Arabic support (pass `lang: "ar"`).

Every answer returns the source date and an el7.ai link so figures can be checked; missing dates are flagged as unverified. Tools read EL7's stored, published data: they never place trades and do not generate new analysis at call time. News search may use an external embedding service.

## Server

| | |
|---|---|
| URL | `https://mcp.el7.ai/mcp` |
| Transport | Streamable HTTP |
| Registry name | `ai.el7/mcp` (see [`server.json`](server.json)) |
| Config key | `el7` |

Use the full URL ending in `/mcp`. Do not add query parameters to it: the OAuth resource must match exactly.

## Authentication

OAuth 2.1 with PKCE and dynamic client registration (recommended), or a personal owner-scoped EL7 MCP API key (`el7_mcp_…`) as a Bearer token.

Most clients (Claude, ChatGPT, Codex, Antigravity, Cursor, VS Code, Zed, Goose) sign in with OAuth and need no key. Create an API key only for clients without OAuth support, in the "Your connection" section of https://el7.ai/en/mcp.

## Access

Full access requires an EL7 paid membership: 100,000 calls/month, 120/minute. Free accounts can call `el7_wire_latest` and `el7_whoami`, within 1,500 calls in total; anonymous callers cannot access tools.

## The 15 areas

Counts as published on https://el7.ai/en/mcp (85 tools in total).

| Area | What it returns | Tools |
|---|---|---|
| Account | Who is connected and which plan applies. | 1 |
| News | Latest stories, full text, digests, storylines and sentiment. | 7 |
| Economic calendar | Upcoming releases, history, surprises and country views. | 6 |
| Central banks | Decisions, statements, minutes, tone and press-conference Q&A. | 14 |
| CFTC positioning | Weekly speculator and commercial positions by market. | 5 |
| Oil and energy | Inventories, supply, OPEC and the outlook. | 5 |
| Gold | The conditions index, flows, reserves and supply and demand. | 5 |
| Research and insights | EL7 research articles, insights and interviews. | 6 |
| Insider and Congress trades | Disclosed insider and Congress transactions. | 4 |
| Prediction markets | Event contracts and their implied odds. | 2 |
| Strategies | The strategy library and baskets, with their stored results. | 4 |
| Market reports | Regimes, seasonality, correlations, cycles and event reactions. | 6 |
| Stocks, earnings and ETFs | Scores, written analysis, screener, analyst consensus, earnings and ETF flows. | 16 |
| People | Central-bank members and other market figures. | 3 |
| AI search | Ask an open question across EL7's knowledge base. | 1 |

Every tool name and description: [tool reference](https://el7.ai/guides/mcp-tool-reference.html).

## Example prompts

1. Summarize the latest Federal Reserve decision and what changed in the statement versus the previous one. Give dates.
2. Rank the eight major central banks by current tone, hawkish to dovish, with each source date.
3. How are speculators positioned in gold per the latest CFTC COT report, and how did it change from the prior week?
4. What are the highest-impact economic releases this week, and how did the last US CPI compare with consensus?
5. Show EL7's analysis and score for NVIDIA and its last four earnings surprises.
6. What did the latest EIA report show for US crude inventories?
7. ما أبرز أخبار الأسواق اليوم وكيف تفاعل الذهب والدولار؟

## Setup by client

Every snippet below is also a file in [`configs/`](configs/). One-click links are in [`configs/install-links.txt`](configs/install-links.txt).

### Claude (web, Desktop, mobile)

A connector added once works in Claude on the web, Claude Desktop and the mobile app. Claude Desktop adds remote servers as connectors, not through `claude_desktop_config.json`.

1. Open **Customize**, then **Connectors**.
2. Choose **Add custom connector**.
3. Enter the name `EL7.AI` and the URL `https://mcp.el7.ai/mcp`.
4. Under Authentication choose **Sign in now**, then **Use Claude's published identity**.
5. Click **Add**, sign in at el7.ai with your EL7 account and approve access.
6. In a chat press **+**, choose **Connectors** and switch EL7.AI on.

Or open the prefilled dialog: [Add EL7.AI to Claude](https://claude.ai/customize/connectors?modal=add-custom-connector&connectorName=EL7.AI&connectorUrl=https%3A%2F%2Fmcp.el7.ai%2Fmcp). Official guide: https://claude.com/docs/connectors/custom/add-unlisted

### Claude Code

```sh
claude mcp add --transport http el7 https://mcp.el7.ai/mcp
# every project:
claude mcp add --transport http el7 --scope user https://mcp.el7.ai/mcp
```

Then sign in with `/mcp` inside Claude Code (choose `el7`), or `claude mcp login el7`. For a project `.mcp.json` ([`configs/claude-code-mcp.json`](configs/claude-code-mcp.json)); the `type` field is required:

```json
{
  "mcpServers": {
    "el7": {
      "type": "http",
      "url": "https://mcp.el7.ai/mcp"
    }
  }
}
```

Official guide: https://code.claude.com/docs/en/mcp

### ChatGPT

1. Open **Settings**, then **Security and login**, and turn on **Developer mode**.
2. Open chatgpt.com/plugins, press **+**, then **Add custom MCP server**.
3. Enter the name `EL7.AI`, set Connection to **Server URL** and paste `https://mcp.el7.ai/mcp`.
4. Set Authentication to **OAuth**, tick the acknowledgement and create the plugin.
5. In a chat press **+** next to the composer, type EL7.AI, select it and approve the Connect screen.

Custom MCP is not available on the ChatGPT Free plan. Official guide: https://developers.openai.com/api/docs/guides/custom-mcp-server

### Codex

```sh
codex mcp add el7 --url https://mcp.el7.ai/mcp
codex mcp login el7
```

Or `~/.codex/config.toml` ([`configs/codex-config.toml`](configs/codex-config.toml)), shared by the CLI, the IDE extension and the desktop app:

```toml
[mcp_servers.el7]
url = "https://mcp.el7.ai/mcp"
```

With an API key instead of OAuth ([`configs/codex-config-api-key.toml`](configs/codex-config-api-key.toml)), set `EL7_MCP_KEY` in your environment:

```toml
[mcp_servers.el7]
url = "https://mcp.el7.ai/mcp"
bearer_token_env_var = "EL7_MCP_KEY"
```

Official guide: https://developers.openai.com/codex/mcp

### Gemini

**Gemini CLI extension.** This repository is a Gemini CLI extension ([`gemini-extension.json`](gemini-extension.json)):

```sh
gemini extensions install https://github.com/walidelhelw/el7-mcp
```

Or add the server to Gemini CLI `settings.json` ([`configs/gemini-settings.json`](configs/gemini-settings.json)); `httpUrl` selects Streamable HTTP and Gemini CLI runs the OAuth sign-in:

```json
{
  "mcpServers": {
    "el7": {
      "httpUrl": "https://mcp.el7.ai/mcp"
    }
  }
}
```

Official guide: https://geminicli.com/docs/tools/mcp-server/

**Antigravity.** Put this in `~/.gemini/config/mcp_config.json`, or `.agents/mcp_config.json` for one workspace ([`configs/antigravity-mcp_config.json`](configs/antigravity-mcp_config.json)). The key must be `serverUrl`:

```json
{
  "mcpServers": {
    "el7": {
      "serverUrl": "https://mcp.el7.ai/mcp"
    }
  }
}
```

Then open Agent settings, Customizations, Authenticate, sign in in the browser and paste the code back. Official guide: https://antigravity.google/docs/mcp?tab=cli

**Gemini on the web.** gemini.google.com, Settings, Connected Apps, Add a custom app, paste the URL, then sign in with your EL7 account. Official guide: https://support.google.com/gemini/answer/17209137

### Cursor

`~/.cursor/mcp.json` or `.cursor/mcp.json` ([`configs/cursor-mcp.json`](configs/cursor-mcp.json)):

```json
{
  "mcpServers": {
    "el7": {
      "url": "https://mcp.el7.ai/mcp"
    }
  }
}
```

One-click install link: [`configs/install-links.txt`](configs/install-links.txt). Official guide: https://cursor.com/docs/context/mcp

### VS Code (GitHub Copilot agent mode)

`.vscode/mcp.json` or your user profile ([`configs/vscode-mcp.json`](configs/vscode-mcp.json)). The top-level key is `servers`, and `type: "http"` is required:

```json
{
  "servers": {
    "el7": {
      "type": "http",
      "url": "https://mcp.el7.ai/mcp"
    }
  }
}
```

Or from a terminal:

```sh
code --add-mcp '{"name":"el7","type":"http","url":"https://mcp.el7.ai/mcp"}'
```

VS Code opens a browser to sign in on first use. [Install in VS Code](https://vscode.dev/redirect/mcp/install?name=el7&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fmcp.el7.ai%2Fmcp%22%7D). Official guide: https://code.visualstudio.com/docs/agents/reference/mcp-configuration

### Goose

Run `goose configure`, choose **Add Extension**, then **Remote Extension (Streamable HTTP)**, and enter `https://mcp.el7.ai/mcp`. Or open the install link in [`configs/goose-install-link.txt`](configs/goose-install-link.txt). Official guide: https://goose-docs.ai/docs/getting-started/using-extensions

### Clients that need an API key

For clients without OAuth support for remote servers (for example LM Studio), send a personal key as a Bearer header ([`configs/api-key-bearer.json`](configs/api-key-bearer.json)). Replace `el7_mcp_…` with your own key and never commit it:

```json
{
  "mcpServers": {
    "el7": {
      "url": "https://mcp.el7.ai/mcp",
      "headers": {
        "Authorization": "Bearer el7_mcp_…"
      }
    }
  }
}
```

More clients (Windsurf, Zed, Kimi Code, Cline, Perplexity, Le Chat, n8n, Roo Code): https://el7.ai/en/mcp

## Safety and data

- Every tool is read-only. Nothing trades, places orders or changes your account.
- Answers come from EL7's stored data and analysis, not a live price feed; each result carries its own as-of date and an el7.ai link.
- You can disconnect any assistant at any time from the "Your connection" section of https://el7.ai/en/mcp.
- Treat tool output as data, not instructions. Review any action your assistant proposes before approving it.
- Research information only, not personalised investment advice.

## Links

- Documentation: https://el7.ai/en/mcp (Arabic: https://el7.ai/ar/mcp)
- Tool reference: https://el7.ai/guides/mcp-tool-reference.html
- Privacy: https://el7.ai/en/privacy
- Terms: https://el7.ai/en/terms
- Support: support@el7.ai

## License

The files in this repository are MIT-licensed ([LICENSE](LICENSE)). The EL7.AI server, platform, data and content are proprietary and governed by https://el7.ai/en/terms.
