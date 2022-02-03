Database:

```sh
docker pull postgres

mkdir -p /home/luiz/docker/volumes/postgres2

docker run --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /home/luiz/docker/volumes/postgres:/var/lib/postgresql/data postgres

sudo docker exec -it pg-docker /bin/bash

psql -h localhost -U postgres -d postgres
```

Rails:

`When running a rails command, restart the server. I've got some strange errors when I didn't restart`

```sh
bin/rails g scaffold Product title:string description:text image_url:string price:decimal

bin/rails g controller Store index

bin/rails g scaffold Cart

bin/rails g scaffold LineItem product:references cart:belongs_to

# the two patterns that rails matches on are AddXXXToYYY and RemoveXXXFromYYY, where XXX is ignored
bin/rails g migration add_quantity_to_line_items quantity:integer

bin/rails g migration combine_items_in_cart

bin/rails g migration add_price_to_line_items price:decimal

bin/rails g migration copy_price_to_line_items

bin/rails g channel products

bin/rails g scaffold Order name address:text email pay_type:integer

bin/rails g migration add_order_to_line_item order:references

# webpacker
bin/rails webpacker:install:react

# toggle caching on and off in the dev env
bin/rails dev:cache

# creates the database
bin/rails db:setup

bin/rails db:migrate

bin/rails db:migrate:status

bin/rails db:rollback

bin/rails db:seed

# can be used to run the fixtures manually
bin/rails db:test:prepare
```

Test:

```sh
bin/rails test

bin/rails test:models

bin/rails test:controllers

bin/rails test:system
```

Debug:

```sh
# keep up with the log showing on a terminal
tail -f log/development.log

# clear test logs
bin/rails log:clear LOGS=test
```
