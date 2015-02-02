module GiantBomb
  module Response
    class Status
      OK = 1
      INVALID_API_KEY = 100
      OBJECT_NOT_FOUND = 101
      ERROR_IN_URL_FORMAT = 102
      JSONP_ERROR = 103
      FILTER_ERROR = 104
      SUBSCRIBER_ONLY = 105
    end
  end
end