# 📪 Zipcode-API

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Testing](#testing)

## About <a name = "about"></a>

The aim of this project is to showcase my skills in developing Rails API.

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to run the project.

- Docker
- docker-compose

The technologies involved in this project.

- Docker (26.0.0)
- docker-compose (2.26.1)
- Postgres (16.X)
- Ruby (3.3.0)
- Rails (7.1.3)

### Installing

A step by step series of examples that tell you how to get a development env running.

Clone this repository
```bash
git clone git@github.com:gabrielmbarboza/zipcode-api.git
```

Copy or create new files from files with the `.sample` extension and then replace the environment variables in **.env** directory.

```bash
cp app.sample app
```

```bash
cp database.sample database
```

Create and migrate the database.

```docker
docker compose run --rm zipcode bin/rails db:create
```

```docker
docker compose run --rm zipcode bin/rails db:migrate
```

or use only the task `db:setup`.

```docker
docker compose run --rm zipcode bin/rails db:setup
```

Use the `zipcode:dev` task to populate the development database with valid citiens.

```docker
docker compose run --rm zipcode bin/rails zipcode:dev
```

End with an example of getting some data out of the system or using it for a little demo.

## Usage <a name = "usage"></a>

Using Docker and docker-compose, just run the following command.

```docker
docker compose up
```

Endpoint for logging in and receiving the token

```
POST http://0.0.0.0:3000/login HTTP/1.1
content-type: application/json

{
    "email": "user1@example.com",
    "password": "123"
}
```

Endpoint to get the zipcode information

```
GET http://0.0.0.0:3000/zipcodes/04313-110 HTTP/1.1
content-type: application/json
Authorization: Bearer paste_your_token_here
```

## Testing <a name = "testing"></a>

Use the following command to run all the tests.

```docker
$ docker compose run --rm zipcode bin/rails test ./test
```

## Todo <a name = "todo"></a>

- [ ] Model tests.
- [ ] Controller and request tests
- [ ] AuthenticationService tests
- [ ] Improve API performance.

