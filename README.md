# Volunteer Tracker

#### Database Basics Independent Project, 05/05/2017

#### By Brian Fan

## Description

Volunteer Tracker is web application that help non-profit organization to manage volunteers and projects.

## Setup/Installation Requirements

* Install Ruby and Ruby gem 'Sinatra'
* Install Postgres following [this instructions](https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef)
* In PSQL, CREATE DATABASE volunteer_tracker;  
* In PSQL, CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);
* In PSQL, CREATE TABLE projects (id serial PRIMARY KEY, description varchar);
* Clone this repository
* Open terminal and run ruby app.rb
* Copy and the past http://localhost:4567 to the browsers

## Technologies Used

_HTML_

_CSS_

_Bootstrap_

_Ruby_

### License

Copyright (c) 2017 Brian Fan
The website is licensed under the MIT license.
