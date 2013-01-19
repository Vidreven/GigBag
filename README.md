## Build Status
[![Build Status](https://buildhive.cloudbees.com/job/Vunovati/job/uskoci/badge/icon)](https://buildhive.cloudbees.com/job/Vunovati/job/GigBag/)
[![Build Status](https://travis-ci.org/Vunovati/GigBag.png?branch=add_cucumber)](https://travis-ci.org/Vunovati/GigBag)
GigBag
======

Download with:
`$ git clone git@github.com:Vunovati/gigbag.git`
`$ cd GigBag`

Automatically changes rvm to a new gemset (set in .rvmrc)

`$ gem install bundle`

Install dependencies

`bundle install --without production`

To run tests:

`$ bundle exec rake db:migrate`
`$ bundle exec rake db:test:prepare`
`$ bundle exec rspec spec`

Run server on `localhost:3000`
`$ rails s`
