== README

Assuming ruby 2 +

## Setup:

> bundle install

> rake db:create

> rake db:migrate

- After extracting sql dump from db_dump.zip

> mysql -u <username> -p bustrack < db_dump.sql

## Run Server:

> rails s

> visit localhost:3000

## Functionality:

- Default view:
  + All bus routes
  + Top 20 places visited overall with precision of 2 places (lat, lng)

- Options:
  + Select a specific bus to view its details - places the bus stops, top n places visited
  + Select "n" for top n places
  + Select precision of GPS for grouping close by places in frequently visited

- Sample Links for views: (assuming server is running on localhost:3000)
  + [Top 25 places overall](http://localhost:3000/bus_positions/bus_detail?utf8=%E2%9C%93&bus_id=&commit=submit&precision=0)
  + [Top 25 places for bus number 59](http://localhost:3000/bus_positions/bus_detail?utf8=%E2%9C%93&bus_id=59&commit=submit&precision=0)