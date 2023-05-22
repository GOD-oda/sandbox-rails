.PHONY: build
build:
	docker compose build --no-cache

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down --remove-orphans

.PHONY: restart
restart:
	@make down
	@make up

.PHONY: db_create
db_create:
	docker compose exec app rails db:create

.PHONY: db_migrate
db_migrate:
	docker compose exec app rails db:migrate

.PHONY: db_init
db_init:
	@make db_create
	@make db_migrate
