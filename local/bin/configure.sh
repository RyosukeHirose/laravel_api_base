#!/bin/bash
set -eu

# rand_chars() {
# 	openssl rand -base64 64 | perl -E 'local $/; $_=<>; s#\n#_#g;s#/#.#g;s#/#!#g; for my $c(1..'$1') { print substr($_,$c,1_) }; say ""'
# }

# do_localenv() {
# 	# MINIO_ACCESS_KEY="$( rand_chars 32 )"
# 	# MINIO_SECRET_KEY="$( rand_chars 32 )"
# 	cat > $BASEDIR/.env << EOS
# COMPOSE_PROJECT_NAME=news_technology
# PROJECT_PATH=../src
# LOGS_PATH=./var/logs
# TZ=Asia/Tokyo
# WEB_PORT=8080
# APP_PORT=9000
# DB_PORT=3306
# # DB_TESTING_PORT=13307
# DB_NAME=news_technology
# DB_USER=admin
# DB_PASS=password
# DB_SLAVE_HOST=db
# DB_SLAVE_PORT=3306
# DB_MASTER_HOST=db
# DB_MASTER_PORT=3306
# EOS
# 	echo "Write: $BASEDIR/.env"
# }


# load_env() {
# 	if [ -e $BASEDIR/.env ]; then
# 		eval $( cat $BASEDIR/.env | perl -nlpE 's#^(.+)=(.+)$#$1="$2"#' )
# 		echo "Load $BASEDIR/.env"
# 	fi
# }

# laravelenv() {

# 	load_env

# 	# Laravel6はAPP_KEY=は空キーでないとキーの生成に失敗する
# 	cat > $BASEDIR/../src/.env << EOS
# APP_NAME=news_technology
# APP_ENV=local
# APP_DEBUG=true
# APP_URL=http://localhost:8080
# APP_KEY=

# LOG_CHANNEL=stack

# DB_NAME=news_technology
# DB_USER=admin
# DB_PASS=password
# DB_SLAVE_HOST=db
# DB_SLAVE_PORT=3306
# DB_MASTER_HOST=db
# DB_MASTER_PORT=3306


# BROADCAST_DRIVER=log
# CACHE_DRIVER=file
# QUEUE_CONNECTION=sync
# SESSION_DRIVER=file
# SESSION_LIFETIME=120

# REDIS_HOST=127.0.0.1
# REDIS_PASSWORD=null
# REDIS_PORT=6379

# MAIL_DRIVER=smtp
# MAIL_HOST=smtp.mailtrap.io
# MAIL_PORT=2525
# MAIL_USERNAME=
# MAIL_PASSWORD=
# MAIL_FROM_ADDRESS=noreply@dev-booster.newstech.co.jp
# MAIL_BCC_ADDRESS=test@aaa.co.jp
# MAIL_BCC_ADDRESS=test@aaa.co.jp

# AWS_ACCESS_KEY_ID=
# AWS_SECRET_ACCESS_KEY=
# AWS_DEFAULT_REGION=
# AWS_BUCKET=

# PUSHER_APP_ID=
# PUSHER_APP_KEY=
# PUSHER_APP_SECRET=
# PUSHER_APP_CLUSTER=mt1

# EOS
# 	cat >> $BASEDIR/../src/.env << 'EOS'
# MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
# MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
# EOS
# 	echo "Write: $BASEDIR/../src/.env"

# 	echo "-- Generate Key"
# 	docker-compose exec app php artisan key:generate
# }

# do_all() {
# 	do_localenv
# 	do_laravelenv
# }

# run() {

#     for i in $COMMANDS; do
#     if [ "$i" == "${1:-}" ]; then
#         shift
#         do_$i $@
#         exit 0
#     fi
#     done
#     echo "USAGE: $( basename $0 ) COMMAND"
#     echo "COMMANDS:"
#     for i in $COMMANDS; do
#     echo "   $i"
#     done
#     exit 1
# }

# BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
# COMMANDS="localenv laravelenv all"
# run $@

