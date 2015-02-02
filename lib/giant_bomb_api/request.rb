module GiantBombApi
  class Request
    attr_accessor :params

    def initialize(endpoint, params)
      @params = params
    end
  end
end
