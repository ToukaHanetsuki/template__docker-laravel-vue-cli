DOCKER_EXEC_APP=docker-compose exec app

setup:
	docker-compose up -d --build
	@make server/install
	docker-compose run --rm app cp .env.example .env
	docker-compose run --rm app php artisan key:generate
	@make server/migrate

up:
	docker-compose up --build

stop:
	docker-compose stop

bash:
	$(DOCKER_EXEC_APP) bash

down:
	docker-compose down --rmi all --volumes --remove-orphans

# server
server/install:
	@make server/install-for-container
	# @make server/install-for-host

server/install-for-container:
	$(DOCKER_EXEC_APP) composer install

server/install-for-host:
	docker-compose run --rm -v $$(pwd):/code -w /code app composer install

server/migrate:
	$(DOCKER_EXEC_APP) php artisan migrate
