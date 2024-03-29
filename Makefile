up:
	docker compose up -d
build:
	docker compose build
down:
	docker compose down
create-project:
	docker compose exec php composer create-project --prefer-dist "laravel/laravel=" .
install:
	docker compose exec php composer install
	docker compose exec php cp .env.example .env
	docker compose exec php php artisan key:generate
	sudo chmod -R 777 ./src/storage/
	sudo chmod -R 777 ./phpmyadmin/sessions/
	docker compose run --rm -it npm npm ci
migrate:
	docker compose exec php php artisan migrate
seeder:
	docker compose exec php php artisan db:seed --class=DatabaseSeeder
dev:
	docker compose run --rm npm npm run build
stop:
	docker compose stop
reboot:
	docker compose down
	docker compose build
	docker compose up -d
destroy:
	docker compose down --rmi all --volumes
ps:
	docker compose ps
.PHONY: php
php:
	docker compose exec php bash