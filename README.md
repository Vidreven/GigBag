## Build Status
[![Build Status](https://buildhive.cloudbees.com/job/Vunovati/job/uskoci/badge/icon)](https://buildhive.cloudbees.com/job/Vunovati/job/GigBag/)

cd GigBag

Automatically changes rvm to a new gemset (set in .rvmrc)

gem install bundle
To run tests:

bundle exec rake db:migrate
bundle exec rake db:test:prepare
bundle exec rspec spec