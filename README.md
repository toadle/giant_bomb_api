# Giant Bomb API

An unofficial ruby wrapper for the [Giantbomb API](http://api.giantbomb.com). An API that provides structured data about videogames. You should inform yourself about the endpoints at http://www.giantbomb.com/api/documentation .

This gem aims to provide access to most endpoints on the API. You'll be able to **search**, **filter** and page throught most of them. See further below on what is supported. 

**Contributors are welcome**. Please contact [@toadle](https://github.com/toadle).

[![Code Climate](https://codeclimate.com/github/toadle/giant_bomb_api/badges/gpa.svg)](https://codeclimate.com/github/toadle/giant_bomb_api)
[![Test Coverage](https://codeclimate.com/github/toadle/giant_bomb_api/badges/coverage.svg)](https://codeclimate.com/github/toadle/giant_bomb_api/coverage)
[![Circle CI](https://circleci.com/gh/toadle/giant_bomb_api/tree/dev.svg?style=svg)](https://circleci.com/gh/toadle/giant_bomb_api/tree/dev)

## Changelog
* **2015-09-19**: Initial release as 0.5.1

# Installation

As you'd expect. Nothing special here: 

```
gem install giant_bomb_api
```

or in your `Gemfile`

```
gem giant_bomb_api
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

### General search
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

your can then use `GiantBombApi.client` to send the request like: 

```
GiantBombApi.client.send_request(<your request>)
```

This returns a `GiantBombApi::Response` where your can find your results in `response.results`. This might be a collection of things or just one object.


### Getting details

If you want a special object by ID you can just do something like:

```
GiantBombApi::Resource::Game.find(id)
```

Available resources are:

```
- GiantBombApi::Resource::Accessory
- GiantBombApi::Resource::Character
- GiantBombApi::Resource::Chat
- GiantBombApi::Resource::Company
- GiantBombApi::Resource::Concept
- GiantBombApi::Resource::Franchise
- GiantBombApi::Resource::Game
- GiantBombApi::Resource::GameRating
- GiantBombApi::Resource::Genre
- GiantBombApi::Resource::Location
- GiantBombApi::Resource::Object
- GiantBombApi::Resource::Person
- GiantBombApi::Resource::Platform
- GiantBombApi::Resource::Promo
- GiantBombApi::Resource::RatingBoard
- GiantBombApi::Resource::Region
- GiantBombApi::Resource::Release
- GiantBombApi::Resource::Review
- GiantBombApi::Resource::Theme
- GiantBombApi::Resource::UserReview
- GiantBombApi::Resource::Video
- GiantBombApi::Resource::VideoType
```

### Requesting collections

You can also directly query a resource that has a collection-endpoint.

This is available for all resources that the [Giantbomb API](http://www.giantbomb.com/api/documentation) offers a 'collection' for. e.g. `game` and `games`or `character` and `characters`.

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
The giant_bomb_api-gem is released under the [MIT License](http://opensource.org/licenses/MIT).
