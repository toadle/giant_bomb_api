require 'digest'
require 'uri'
require 'faraday'
require 'faraday_middleware'
require 'json'

module GiantBombApi
  class Client
    attr_accessor :api_key

    API_URL = 'https://www.giantbomb.com/api/'.freeze

    def initialize(api_key: nil, options: {})
      @api_key = api_key
      @options = options
    end

    def send_request(giant_bomb_api_request)
      connection = Faraday.new(url: API_URL) do |faraday|
        faraday.request  :url_encoded
        faraday.use      FaradayMiddleware::FollowRedirects
        faraday.adapter  Faraday.default_adapter
      end

      response = connection.get do |req|
        req.url giant_bomb_api_request.end_point
        req.options[:timeout] = 5
        req.options[:open_timeout] = 2
        req.params = giant_bomb_api_request.params.merge(format: 'json', api_key: api_key)
      end 

      response_json = JSON.parse(response.body)

      if(response_json["status_code"] == 1)
        response = handle_success_response(response_json)
        response.request = giant_bomb_api_request
        response
      else
        handle_error_response(response_json)
      end
    end

    private

    def handle_success_response(response_json)
      GiantBombApi::Response.new response_json
    end

    def handle_error_response(response_json)
      raise Exception::ApiError.new(response_json["status_code"], response_json["error"])
    end

  end
end
