# Ollama MCP Example

### Based on projects:
- https://ollama.com/
- https://github.com/open-webui/open-webui
- https://github.com/flexnst/ollama-mcp-bridge
- https://github.com/sparfenyuk/mcp-proxy
- https://github.com/modelcontextprotocol/servers/blob/main/src/fetch/README.md

## Setup

1. Clone and start docker compose environment:
```bash
git clone https://github.com/flexnst/ollama-mcp-example.git
cd ollama-mcp-example
make init
```

2. Wait for docker images pulled and built
3. Go to Open-WebUI interface: http://localhost:3000
4. Select and download your LLM models (see on https://ollama.com/search?c=tools)
```bash
make ollama-cli
ollama pull qwen2.5:7b # for example
```
5. Good luck with your AI experiments!

## Available commands:

- `make init` - Init new docker compose environment
- `make up` - Up environment
- `make down` - Stop enviroment
- `make ollama-cli` - Docker ollama enviroment

## Tools available out of the box:

### [fetch](https://github.com/modelcontextprotocol/servers/blob/main/src/fetch/README.md)
This tool enables LLMs to retrieve and process content from web pages, converting HTML to markdown for easier consumption.

### How to add my tools?

`compose.yml`
```yaml
  mcp-proxy:
    container_name: mcp-proxy
    image: mcp-proxy:latest
    build:
      context: mcp-proxy
      dockerfile: Dockerfile
    command: |
      --pass-environment --host=0.0.0.0 --port=8096 --allow-origin=*
      --transport=sse
      -- uvx mcp-server-fetch --ignore-robots-txt --user-agent='${FETCH_USER_AGENT}'
```

You can add your tools using `uvx`, for additional info see:
https://github.com/sparfenyuk/mcp-proxy#22-example-usage

### Where can I see the available tools (mcp servers)?

https://github.com/modelcontextprotocol/servers

## License

MIT.