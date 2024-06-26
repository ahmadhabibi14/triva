# Triva - Quiz App

### Tech Stack
1. [Golang](https://go.dev)
2. [Fiber](https://gofiber.io/)
3. [PostgreSQL](https://www.postgresql.org/)
4. [Redis](https://redis.io/)
5. [Docker](https://docker.com/)

### Start docker service
```bash
sudo systemctl start docker

make docker-dev-up
```

### Make database migration
```bash
make migrate state=migration_state
make migrate-up
make migrate-down
make migrate-fix version=migration_version
```

### Enter to PostgreSQL
```bash
docker exec -it triva-db psql -U habi -d triva -W

# restore db
make restore
```

### Enter to Redis
```bash
docker exec -it triva-redis redis-cli -h localhost -p 6379
```

### Start development
```bash
# install intial tool
make setup

# install libraries or dependencies
go mod download

# run go server with air hot reload
air

# run svelte
cd client
pnpm dev
```

```bash
├─ _docker-data       # Docker container data
├─ bin                # Binary compiled
├─ cmd                # Apps
├─ configs            # Configs for service/dependency
├─ database           # Database migration stuff
├─ docs               # Config generated swagger API Docs
├─ helper             # Other codes, can be imported anywhere
├─ internal           # Most logical, including app wrapper
│   ├─ bootstrap      # App components
│   ├─ controller     # Business logic, http handler
│   ├─ repository     # Repository layer, database integration
│   ├─ service        # Service layer
│   └─ web            # Web-Server stuff
├─ logs               # Log files
├─ script             # Automation scripts, including CI/CD
├─ test               # Unit test, integration test
└─ tmp                # Temporary files, for development

```