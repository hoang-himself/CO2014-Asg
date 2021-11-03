# Demo application

## How to run

1. Install Docker
2. Run this in your terminal

```bash
docker network create postgres-network &&\
docker volume create postgres-volume &&\
docker compose up -d
```

3. Go to `localhost:8080` to access pgAdmin.
Login using the credentials in `.pgadmin.env`.
4. Right click `Servers` -> `Create server`.
Follow the configs defined in `.postgres.env` and `.pgadmin.env`

* Name: your choice
* Host name/address: `postgres`
* Port
* Maintenance database
* Username
* Password
