# Rails Docker

This repository is build docker container for rails application.

## Caution

This repository is prototype stage and incomplete.
Please use caution when using.

## How to use

```sh
$ mkdir {application name}; cd $_
$ git clone https://github.com/hato-poppo/rails-docker.git
```

```sh
$ docker-compose build
$ docker-compose run --rm  web rails new . -d postgresql --api --minimal
$ docker-compose run --rm web rake db:create
$ docker-compose up
```

## Change remote repository url

```sh
$ git remote set-url origin {new url}
```

<!--
References
https://docs.docker.com/compose/rails/
https://sinsoku.hatenablog.com/entry/2021/03/24/100000
https://qiita.com/fukushi_yoshikazu/items/c9beba97914d89ab4022
https://upinetree.hatenablog.com/entry/2018/12/08/135608
-->
