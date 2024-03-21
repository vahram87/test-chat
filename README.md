# Test Chat

## System Requirements

* Ruby version 3.2.2
* Postgres version 11
* Rails version 7.1.3

## Configuration

### Environment Variables

Create an environment file that's loaded by [dotenv](https://github.com/bkeepers/dotenv):

```shell
$ cp .env.template .env
```


### Database

Database credentials are stored in `.env.development.local` file
(**do not** store these in `config/database.yml`):

```env
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_NAME=test-chat
DATABASE_USERNAME=my_username
DATABASE_PASSWORD=my_password
```

Create local development and test databases, run migrations, seed DB data

```shell
$ rake db:create
Created database 'test-chat_development'
Created database 'test-chat_test'

$ rake db:migrate
$ rake db:seed
```

## Running

Start Rails web server:

```shell
=> Booting Puma
=> Rails 7.1.3.2 application starting in development 
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 6.4.2 (ruby 3.2.2-p53) ("The Eagle of Durango")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 10446
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop


## Testing

run bundle exec rspec


