# Dockerize your Hanami applications

Dockerfile uses Ruby 2.5 Alpine as a base image and
PostgreSQL 10.4 Alpine as a linked container.

**Useful commands:**
1. `make dockerize` – build image and run application on 2300 port
2. `make shell` – enter inside container
3. `make shutdown` – stop container
4. `make new` – creates a new hanami application using postgresql
5. `make launch` – launches the containers

### Step 1

Clone this repo into your working dir.

### Step 2

Run `make dockerize`

### Step 3

Run `make new`

### Step 4

Run `make shutdown`

### Step 5

In you .dev.env and .test.env files massage the following:
```
DATABASE_URL="postgresql://postgres:example@db/your_project_<development|test>
```

### Step 6

Run `make dockerize`

### Step 7

Create your db:
1. `make shell`
2. `hanami db prepare`
3. `hanami db migrate`

### Final step
Open [http://localhost:2300](http://localhost:2300) in your browser! :champaign:
