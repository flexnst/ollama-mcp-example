init:
	[ ! -f .env ] && cp .env.example .env; \
	docker compose up -d --build

up: down
	docker compose up -d

down:
	docker compose down

ollama-cli:
	docker compose exec ollama bash

clean:
	docker image rm flexnst/mcp-proxy:latest \
	&& docker volume rm ollama open-webui \
	&& rm .env