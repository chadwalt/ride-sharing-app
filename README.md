# Vuugaa
[![CircleCI](https://circleci.com/gh/chadwalt/ride-sharing-app.svg?style=svg)](https://circleci.com/gh/chadwalt/ride-sharing-app)
[![Maintainability](https://api.codeclimate.com/v1/badges/9b38ea3648f389b9fd27/maintainability)](https://codeclimate.com/github/chadwalt/ride-sharing-app/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9b38ea3648f389b9fd27/test_coverage)](https://codeclimate.com/github/chadwalt/ride-sharing-app/test_coverage)

Vuugaa is a RideSharing application that allows you and other Andelans to collaborate and carpool to work.

## Usage
This application is built using the lastest version of [ruby](https://www.ruby-lang.org/en/downloads/) and rails which can be downloaded from [here](https://rubyonrails.org/)

Clone the repo using this command bellow
```
git clone https://github.com/chadwalt/ride-sharing-app.git
```

After cloning download and install the application dependencies using the command below
```
bundle install
```

The application uses `postgresql` as the default database. Execute the following commands to fully setup the database.
```
rails db:migrate
rails db:setup
```

To run the application you can use the built in server of rails which webrick and to do this, the command below needs to be executed.
```
rails s
```

The application folder contains a `.env_sample` file that contains all env variables that need to be defined for the application to run.