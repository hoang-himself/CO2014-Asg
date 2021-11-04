# Demo application

## Setting up

0. Clone this repo
1. Install Docker
2. Run this in your terminal

```bash
docker network create postgres-network &&\
docker volume create postgres-volume &&\
docker compose up -d
```

3. Run the `ddl.sql` on the database, with PopSQL or anything. Database connection properties can be found in `.postgres.env`

## Endpoints

* POST: /ambulance/new
* GET: /ambulance/all
* GET: /ambulance/<Car_number>
* DELETE: /ambulance/<Car_number>/delete

## DB statistics

We use the included pgAdmin for this.

1. Go to `localhost:8080` to access pgAdmin.
Login using the credentials in `.pgadmin.env`.
2. Right click `Servers` -> `Create server`.
Follow the configs defined in `.postgres.env` and `.pgadmin.env`

* Name
* Host name/address: `postgres`
* Port
* Maintenance database
* Username
* Password
