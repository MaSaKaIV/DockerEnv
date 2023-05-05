# !/bin/ps1

docker-compose build
# djangoイメージだけ先に起動しておく
docker-compose run -d db --name=django
# appコンテナの中に入る
docker-compose run app /usr/bin/zsh