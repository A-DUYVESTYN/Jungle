# Jungle

A mini e-commerce application for plants, built with Rails 6.1.

Features:
- Homepage displays product cards, all or by category
- Cart and checkout
- User signup, login, and authentication
- Admin dashboard to manage categories, products (username/password protected)

Tech Stack:
- Ruby on Rails 6.1
- HTML/ERB
- Stripe
- postgreSQL / Active Record
- bcrypt/ has_secure_password
- Sass and bootstrap
Testing
- Feature testing: rspec-rails
- Integration testing: Cypress, cypress-rails, DatabaseCleaner

## Setup

To get started with Rails 6.1, review the [Rails Guide](http://guides.rubyonrails.org/v6.1/)

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Navigate to localhost:3000

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
