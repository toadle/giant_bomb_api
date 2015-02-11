require 'active_support/all'

require "giant_bomb_api/resource"
require "giant_bomb_api/resource_value_setter"
require "giant_bomb_api/resource/game"
require "giant_bomb_api/resource/platform"
require "giant_bomb_api/resource/game_rating"
require "giant_bomb_api/resource/factory"
require "giant_bomb_api/resource/image"
require "giant_bomb_api/resource/character"
require "giant_bomb_api/resource/company"
require "giant_bomb_api/response"
require "giant_bomb_api/exception"
require "giant_bomb_api/exception/api_error"
require "giant_bomb_api/client"
require "giant_bomb_api/request"
require "giant_bomb_api/request/search"

module GiantBombApi

  class Configuration
    attr_accessor :api_key
  end

  class << self
    attr_accessor :configuration
  end

  def self.raise_error(message)
    raise Exception.new message
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)

    @@client = nil
  end

  def self.search(query)
    client.send_request(Request::Search.new(query))
  end

  def self.client
    raise_error "Configure GiantBombApi-module before using" if configuration.nil?
    raise_error "Configure 'api_key' first" if configuration.api_key.nil?

    @@client ||= GiantBombApi::Client.new(api_key: configuration.api_key)
  end

end