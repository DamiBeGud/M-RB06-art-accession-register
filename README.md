# Art Accession Register

An internal Rails API for artwork accessions. With Ruby 3.3, run `bundle install` and `bundle exec rake unit`. Provide `DATABASE_URL` for an assigned PostgreSQL database and `SECRET_KEY_BASE` for production. Apply native migrations with `bundle exec rails db:migrate`, then start `bundle exec puma -C config/puma.rb`. Puma listens on all interfaces on port 8406 by default and accepts `PORT` as an override.

`GET /health/live` checks the process. `GET /ready` checks the migrated database. `POST /accessions` stores `reference`, `title`, `collection_year` and `medium`. Accepted mediums are ceramic, paper, textile and wood. `GET /accessions/{reference}` reads the row. `GET /accessions` accepts `medium`, `from_year` and `to_year`, and returns the first 100 matches in insertion order. A duplicate reference returns 409.

AI-assisted benchmark source. The unit suite exercises input rules without a database. Use an empty assigned database for integration checks.
