DOCKER_EXEC_APP=docker-compose exec app

setup:
	docker-compose up -d --build
	@make backend/install
	docker-compose run --rm app cp .env.example .env
	docker-compose run --rm app php artisan key:generate
	@make backend/migrate

up:
	docker-compose up --build

stop:
	docker-compose stop

bash:
	$(DOCKER_EXEC_APP) bash

down:
	docker-compose down --rmi all --volumes --remove-orphans

# Backend
backend/install:
	@make backend/install-for-container
	# @make backend/install-for-host

backend/install-for-container:
	$(DOCKER_EXEC_APP) composer install

backend/install-for-host:
	docker-compose run --rm -v $$(pwd):/code -w /code app composer install

backend/migrate:
	$(DOCKER_EXEC_APP) php artisan migrate
