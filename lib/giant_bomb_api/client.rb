require 'digest'
require 'uri'
require 'faraday'
require 'json'

module GiantBombApi
  class Client
    attr_accessor :api_key

    API_URL = 'http://api.giantbomb.com'

    def initialize(api_key: nil, options: {})
      @api_key = api_key
      @options = options
    end

    def send_request(giant_bomb_api_request)
      conn = Faraday.new(:url => API_URL) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end

      response = conn.get "#{API_ENDPOINT}", giant_bomb_api_request.request_params

      raise Exception.new("Status: #{response.status}): #{response.body}") if(response.status != GiantBomb::Response::Status::OK)

      JSON.parse(response.body)
    end

  end
end