Live Site: [JobBoard](https://job-board-rails-app.herokuapp.com/)

## Overview
JobBoard is a simple two-sided web application for applicants and employers. Current functionality handles fully-functioning user authentication, the ability for applicants to apply to job listings, and the ability for employers to create listings and view applicants.

The technology stack used utilizes Rails with PostgreSQL for the backend.
## Contents
* [Install](#install)
* [Technologies Used](#technologies-used)
* [Employer Features](#employer-features)
* [Applicant Features](#applicant-features)
* [DB Schema](#db-schema)


## Install
To run JobBoard locally:
```
$ git clone https://github.com/jonathanbridges/job-board
$ cd job-board
$ bundle install
```

Database creation and initialization:
```
$ bundle exec rails db:setup
```

Deployment instructions:
```
$ bundle exec rails server
$ navigate to http://localhost:3000/#/
```
## Technologies Used
* Framework: Ruby on Rails (v5.2.3)
* Database: PostgreSQL (v11.4)
* User Authentication: Created using BCrypt (v3.1.7)

## Employer Features
* New employer accounts can create a new company or join an existing company.
* Employers can see an index of job openings for their company.
* Employers can create new job openings for their company.
* Employers can see applicants who have applied for their openings by name.

## Applicant Features
* Applicants can apply to openings from any company.
* Applicants cannot apply to the same opening twice.

## DB Schema

## `users`

| column name   | data type     |details|
:--- |:---:|:---
`id` | integer | not null, primary key
`email` | string | not null, indexed, unique
`is_employer` | boolean | default: false, not null
`company_id` | integer | indexed, foreign key
`password_digest` | string | not null
`session_token` | string | not null, indexed, unique
`created_at` | datetime | not null
`updated_at` | datetime | not null

* index on `email, unique: true`
* `company_id` references `companies`
* index on `company_id`
* index on `session_token, unique: true`

* `applicant` has_many `applications`

## `companies`

| column name   | data type     |details|
:--- |:---:|:---
`id` | integer | not null, primary key
`company_name` | string | not null, indexed, unique
`created_at` | datetime | not null
`updated_at` | datetime | not null

* index on `company_name`

* `company` has_many `openings`

## `openings`
| column name   | data type     |details|
:--- |:---:|:---
`id` | integer | not null, primary key
`company_id` | integer | not null, indexed, foreign key
`title` | string | not null
`description` | string | not null
`created_at` | datetime | not null
`updated_at` | datetime | not null

* `company_id` references `companies`
* index on `company_id`

* `opening` belongs_to `company`
* `opening` has_many `applications`

## `applications`
| column name   | data type     |details|
:--- |:---:|:---
`id` | integer | not null, primary key
`applicant_id` | integer | not null, indexed, foreign key
`opening_id` | integer | not null, indexed, foreign key
`created_at` | datetime | not null
`updated_at` | datetime | not null

* `applicant_id` references `users`
* index on `applicant_id`
* `opening_id` references `openings`
* index on `opening_id`

* `application` belongs_to `applicant`
* `application` belongs_to `opening`
* `application` has_one `company` through `openings`
