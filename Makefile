COMPOSE := docker compose

.PHONY: local down logs ps shell db-shell build clean

local: .env
	$(COMPOSE) up --build

.env:
	cp .env.example .env
	@echo ">> Created .env from .env.example — review and edit secrets before re-running."
	@exit 1

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

shell:
	$(COMPOSE) exec backend bash

db-shell:
	$(COMPOSE) exec db psql -U $${POSTGRES_USER:-postgres} -d $${POSTGRES_DB:-app}

build:
	$(COMPOSE) build

clean:
	$(COMPOSE) down -v
