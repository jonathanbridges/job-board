Live Site: [JobBoard](https://job-board-rails-app.herokuapp.com/)

## Overview
JobBoard is a simple two-sided web application for applicants and employers. Current functionality handles fully-functioning user authentication, the ability for applicants to apply to job listings, and the ability for employers to create listings and view applicants.

The technology stack used utilizes Rails with PostgreSQL for the backend.
## Contents
* [Install](#install)
* [Technologies Used](#technologies-used)
* [Employer Features](#employer-features)
* [Applicant Features](#applicant-features)

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
