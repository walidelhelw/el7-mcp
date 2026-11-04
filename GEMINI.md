# EL7.AI

The `el7` MCP server is EL7.AI's hosted financial market intelligence and research service (https://mcp.el7.ai/mcp). Its tools read EL7's stored, published data: news and the EL7 Wire, the economic calendar, eight central banks, CFTC COT positioning, gold, oil, stocks, earnings, ETFs, insider and Congress trades, market reports, prediction markets, strategies and the research library.

- Every tool is read-only. None of them places trades or changes an account.
- Results are dated snapshots, not live prices. Give each figure's as-of date and its el7.ai link; treat a missing date as unverified.
- Reply in the user's language. Pass `lang: "ar"` to tools when the user writes Arabic.
- An empty result does not prove an event did not happen.
- If a call is refused because it needs a paid EL7 membership, say so and do not retry. Membership details: https://el7.ai/en/mcp
- EL7 content is research information, not personalised investment advice.
