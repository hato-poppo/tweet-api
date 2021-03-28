# Rails Docker

This repository is build docker container for rails application.

## Caution

This repository is prototype stage and incomplete.
Please use caution when using.

## How To Use

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

## Note

In the current configuration, this repository files and rails application files will be mixed together.  
I'm trying to find a better way.

<!--
References
https://docs.docker.com/compose/rails/
https://sinsoku.hatenablog.com/entry/2021/03/24/100000
https://qiita.com/fukushi_yoshikazu/items/c9beba97914d89ab4022
https://upinetree.hatenablog.com/entry/2018/12/08/135608
-->
