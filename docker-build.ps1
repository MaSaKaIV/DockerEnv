# !/bin/ps1

docker-compose build
# mysqlだけ先に起動しておく
docker-compose run -d db
# appコンテナの中に入る
docker-compose run app /usr/bin/zsh