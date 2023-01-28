#!/bin/bash
set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
# source "$BASEDIR/bin/functions"

build() {
	cd "$BASEDIR/local"

	# bin/configure.sh localenv

	docker-compose build

	docker-compose up -d

	# mysql起動確認
	bin/waiting-init-mysql.pl $(docker-compose ps -qa lottery_db)

	if [ -e ../src/composer.json ]; then
		docker-compose exec lottery_app composer install
		# bin/configure.sh laravelenv
		docker-compose exec lottery_app php artisan migrate:fresh --seed
		docker-compose exec lottery_app npm install --legacy-peer-deps
		docker-compose exec lottery_app npm run dev
		# docker-compose exec app busybox crond -f -L /dev/stderr

	else
		docker-compose exec lottery_app composer create-project --prefer-dist "laravel/laravel=9.*" .
		# bin/configure.sh laravelenv
		docker-compose exec lottery_app php artisan migrate:fresh --seed
		# docker-compose exec app composer require laravel/ui
		# docker-compose exec app php artisan ui react
		docker-compose exec lottery_app npm install --legacy-peer-deps
		docker-compose exec lottery_app npm run dev
		# busybox crond -f -L /dev/stderr
	fi
}

build
