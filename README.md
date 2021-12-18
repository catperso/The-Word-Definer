# _The Fantastic Word Definerizer!_

#### By _**Matt C.**_

#### _Ruby Code Review #2 on Routing With Sinatra_

## Description
_A webapp for kids that lets you upload words and then upload definitions to those words. All words and definitions have total CRUD functionality._

## Technologies Used

* _Ruby_
* _rspec_
* _pry_
* _[Docker](https://www.docker.com/)(optional)_
* _Sinatra_
* _Capybara_

## Using this app with Ruby 2.6.5 installed natively (no Docker)

* _Run_ `git clone https://github.com/catperso/The-Word-Definer` _in your terminal to clone this repository to your device, then navigate to the project directory._
* _Run_ `bundle` _to package the Gems and set up Gemfile.lock._
* _Run_ `rspec` _if you want to run the specs for the classes and Capybara integration._
* _Run_ `ruby app.rb` _to start a local server._
* _Open up your web browser and go to_ `http://localhost:4567/` _while the server is running to experience the project!_

## Using this app with Docker

* _First make sure Docker is installed as per the official [instructions](https://docs.docker.com/get-docker/)._
* _Run_ `docker pull ruby:2.6.5` _to pull an image for the same version of Ruby this project was built with._
* _Run_ `git clone https://github.com/catperso/The-Word-Definer` _in your terminal to clone this repository to your device, then navigate to the project directory._
* _Run_ `docker-compose run --rm web bundle exec rspec` _if you want to run the specs for the classes and Capybara integration._
* _Run_ `docker-compose up --build` _to start a local server._
* _Open up your web browser and go to_ `http://localhost:4567/` _while the server is running to experience the project!_

## Known Bugs

_None so far._

## License - [MIT](https://opensource.org/licenses/MIT)

_If you run into any problems/bugs feel free to send me an email [(mc.casperson@gmail.com)](mailto:mc.casperson@gmail.com) with details._

Copyright (c) _2021_ _Matt C._