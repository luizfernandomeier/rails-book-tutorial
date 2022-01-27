Database:

```sh
docker pull postgres

mkdir -p /home/luiz/docker/volumes/postgres2

docker run --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /home/luiz/docker/volumes/postgres:/var/lib/postgresql/data postgres

sudo docker exec -it pg-docker /bin/bash

psql -h localhost -U postgres -d postgres
```

Rails:

```sh
bin/rails g scaffold Product title:string description:text image_url:string price:decimal

# creates the database
bin/rails db:setup

bin/rails db:migrate

bin/rails db:rollback

bin/rails db:seed

# can be used to run the fixtures manually
bin/rails db:test:prepare
```

Test:

```sh
bin/rails test

bin/rails test:models
```
