# Giant Bomb API

An unofficial ruby wrapper for the Giantbomb API (http://api.giantbomb.com). An API that provides structured data about videogames. You should inform yourself about the endpoints at http://www.giantbomb.com/api/documentation .

[![Code Climate](https://codeclimate.com/github/toadle/filter8/badges/gpa.svg)](https://codeclimate.com/github/toadle/filter8)
[![Test Coverage](https://codeclimate.com/github/toadle/filter8/badges/coverage.svg)](https://codeclimate.com/github/toadle/filter8)

# Installation


As you'd expect. Nothing special here: 

```
gem install giant_bomb_api
```

# How to use

## Configuration

Before you use GiantBombApi you need to configure it:
```
GiantBombApi.configure do |config|
  config.api_key = "your api-key"
end
```

## Usage

There is several ways to query the GiantBomb-Database.

### General search.
```
GiantBombApi.search("your query")
```
It will return a list of games that match you query. 

If you want to be more specific, you can create your own search-request: 

```
GiantBombApi::Request::Search.new("your query", resources: [array of GiantBombApi::Resource-classes], limit: 100, page: 1)
```

e.g.

```
GiantBombApi::Request::Search.new("spelunky", resources: [GiantBombApi::Resource::Game], limit: 100, page: 1)
```

or

```
GiantBombApi::Request::Search.new("mario", resources: [GiantBombApi::Resource::Game, GiantBombApi::Resource::Character], limit: 100, page: 1)
```

### Getting details

If you want a special object by ID you can just do something like:

```
GiantBombApi::Resource::Game.find(id)
```

This is available for all resources. This is the currently supported list: 
```
- GiantBombApi::Resource::Character
- GiantBombApi::Resource::Company
- GiantBombApi::Resource::Developer
- GiantBombApi::Resource::Factory
- GiantBombApi::Resource::Game
- GiantBombApi::Resource::GameRating
- GiantBombApi::Resource::Genre
- GiantBombApi::Resource::Platform
- GiantBombApi::Resource::Publisher
- GiantBombApi::Resource::Release
- GiantBombApi::Resource::Video
```

### Requesting collections

You can also directly query a resource that has a collection-endpoint.

e.g. all:

```
GiantBombApi::Resource::Game.all
```

this call supports optional sorting, e.g.:

```
GiantBombApi::Resource::Game.all(sort: { name: :desc })
```

if you want to get more detailed your can do: 

```
GiantBombApi::Resource::Game.where(name: "spelunky", aliases: "something", sort: { name: :desc }, limit: 10, offset: 0)
```

These types of calls are currently supported for: 

```
- GiantBombApi::Resource::Game
- GiantBombApi::Resource::Company
- GiantBombApi::Resource::Character
```

## Response

Every API-request will always return a `GiantBombApi::Response`-object that has the following attributes: 

- `limit`: The limit that applied
- `offset`: The offset that applied
- `number_of_page_results`: Guess!
- `number_of_total_results`: Meeeh...
- `results`: An array of stuff that you were looking for ;-)

For everything else I urge you to look through the code.

## Feedback
Feedback and pull-request are always welcome. 
You can find the author via http://toadle.me

## License
The filter8-gem is released under the [MIT License](http://opensource.org/licenses/MIT).
