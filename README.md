# Rails Docker

This repository is build docker container for rails application.

## Caution

This repository is prototype stage and incomplete.
Please use caution when using.

## How To Use

```sh
$ mkdir {application name}; cd $_
$ git clone {this repository}
```

```sh
$ docker-compose build
$ docker-compose run --rm  web rails new . -d postgresql --api --minimal
$ docker-compose run --rm web rake db:create
$ docker-compose up
```
