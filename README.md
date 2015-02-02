<<<<<<< HEAD
# giant_bomb_api
=======
# filter8
A unofficial ruby wrapper for Filter8 (http://filter8.com). An API to filter lots of stuff from texts, e.g. bad words. 

[![Code Climate](https://codeclimate.com/github/toadle/filter8/badges/gpa.svg)](https://codeclimate.com/github/toadle/filter8)
[![Test Coverage](https://codeclimate.com/github/toadle/filter8/badges/coverage.svg)](https://codeclimate.com/github/toadle/filter8)

# Installation


As you'd expect. Nothing special here: 

```
gem install filter8
```

# How to use

## Configuration

Before you use Filter8 you need to configure it:
```
Filter8.configure do |config|
  config.api_key = "your filter8-api-key"
  config.api_secret = "your filter8-api-secret"
end
```

## Usage

Simply send the content, you wish to filter with the filter-method: 
```
Filter8.filter("your content")
```

If you want to change the **default-options** of filter8 (https://filter8.com/documentation), you can pass an optional options-hash with the filter-configuration:
```
Filter8.filter("your content", blacklist: {enabled: true, locales: [:en, :de, :fr], tags: ["AsciiArt"]})
```

The **email** and **urls** filters are not yet supported.

## Feedback
Feedback and pull-request are always welcome. 
You can find the author via http://toadle.me

## License
The filter8-gem is released under the [MIT License](http://opensource.org/licenses/MIT).
>>>>>>> initial commit
