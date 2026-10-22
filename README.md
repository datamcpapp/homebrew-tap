# DataMCP Homebrew tap

Install the DataMCP local tunnel agent:

```sh
brew tap datamcpapp/tap
brew install datamcp-agent
```

The formula tracks the `latest` release of [`@datamcp/agent`](https://www.npmjs.com/package/@datamcp/agent) on npm. Its source URL and SHA-256 are updated automatically after a release. Create a Local Agent connection in the DataMCP dashboard to get a connection ID and one-time agent token before starting the agent.

The database password stays on the agent machine. SQL and query results transit through DataMCP Cloud.
