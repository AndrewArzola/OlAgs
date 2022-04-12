# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
  ## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11

## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

* Configuration


## Installation ##

Download this code repository by using git:

 `git clone https://github.com/AndrewArzola/OlAgs.git`
  In order to run you must run these commands everytime you update
  
  -bundle install
  -rails webpacker:install (might be optional)
  -rails db:create
  -rails db:migrate
  -rails db:seed
  
  alternatively run this command: bundle install && rails db:create && rails db:migrate && rails db:seed
  Note (required): look at the Execute Code section to learn how to seed your data

 ## Database Creation ##

  rails g scaffold [tablename] [varname:type] 
  rails generate scaffold [tablename] [varname:type]
  
 ## Database Update ##

  rails g migration [Migration name] (depeneding on what you want you need to name this specifically) 

  alternativly name the migration somthing generic and modify the file manualy then db:migrate
  
 ## Database initialization ##

  rails db:migrate (Need to be done after every migration and sacffold)

 ## Tests ##
* How to run the test suite

  rails spec*

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

  Test and Main will auto deploy to heroku
  
  Local deployment
    -rails s
    -rails s --binding=0.0.0.0 (if the former doesn't work)
## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd your_github_here`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd olAgs`

Seed your data

  Our app requires that you have a member in the member table with your email to login in. To do this pre popluate your data baseusing the templates in the comments of the db/seed.rb file. 

  Note: After populating your database, you can run the rake db:seed:dump to dump all your current data into the seed file

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate && rails db:seed`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/


TODO:
## Environmental Variables/Files ##

ENV['GOOGLE_OAUTH_CLIENT_ID'] and ENV['GOOGLE_OAUTH_CLIENT_SECRET'] are set in the development.rb file. 

When integrating oauth to a new application it is important to make sure that the client ID and client secret are the owners and setup through the Google Cloud API platform

## Deployment ##

How to deploy in heroku: https://devcenter.heroku.com/articles/git

## CI/CD ##

Continuous Intregration (CI) and Continuous Deployment (CD) are meant to ensure correctness of the code for each commit. It's recommended that you make sure both are passing before you commit addtional code to the main or test branch.

Continuous Intregration Checks

-rspec test files in spec/
-brakeman (security)
-Rubocop -L (ruby coding standard checker)

Continuous Deployment Checks

-Heroku (Check heroku logs is CD failure)

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.

    
