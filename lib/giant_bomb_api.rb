require 'active_support/all'
require 'require_all'

require_rel 'giant_bomb_api/**/*.rb'

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