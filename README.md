## About Cactus

Cactus is a simple web app that helps people learn coding through various types of programming problems that users can solve with their favorite programming language!
Check out [Cactus](https://cactus.kz).

## Tech stack
Java, Laravel, Tomcat, Vue, Postgres

## Run locally:
- requirements `PostgreSQL`, `php`, `java`, `Tomcat`, `composer`, `node`
- Clone this repository.
- Navigate to `cactus/backend` and run `composer install`.
- Navigate to `cactus/frontend` and run `npm install`.
- Rename `.env.example` to `.env` and configure the project to your requirements.
- Seed a PostgreSQL database with the `init.sql` file.
- In the sandbox directory, run: `mvn install && mvn clean tomcat7:deploy`.
- In the backend directory, run: `php artisan serve`.
- In the frontend directory, run: `npm run dev`.
- Open http://localhost:5173 in your browser.

## New features under development
- Authorization
- User profile page with achievements and friends
- Community page
- Online contests with friends feature
- ability run locally with `docker`
- Detailed error analysis of the code
- More and more problems to solve!
