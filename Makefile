.PHONY: init start stop clean test format generate db composer_install migrate migrate_fresh seed

DOCKER_COMPOSE = docker-compose

init: clean
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
	$(DOCKER_COMPOSE) up -d --build
	sleep 15
	$(DOCKER_COMPOSE) exec app php artisan migrate
	$(DOCKER_COMPOSE) exec app php artisan db:seed

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans
	$(MAKE) composer_install

test:
	$(DOCKER_COMPOSE) exec app php artisan test

format:
	$(DOCKER_COMPOSE) exec app ./vendor/bin/php-cs-fixer fix

generate:
	$(DOCKER_COMPOSE) exec app php artisan ide-helper:models -W
	$(DOCKER_COMPOSE) exec app php artisan ide-helper:generate
	$(DOCKER_COMPOSE) exec app php artisan ide-helper:meta
	$(MAKE) format

composer_install:
	$(DOCKER_COMPOSE) run --rm app rm -rf vendor
	$(DOCKER_COMPOSE) run --rm app composer install

migrate:
	$(DOCKER_COMPOSE) exec app php artisan migrate

migrate_fresh:
	$(DOCKER_COMPOSE) exec app php artisan migrate:fresh

seed:
	$(MAKE) migrate_fresh
	$(DOCKER_COMPOSE) exec app php artisan db:seed
