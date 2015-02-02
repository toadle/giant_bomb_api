module GiantBombApi
  class Response
    attr_accessor :json

    def initialize(json)
      @json = json
    end
    
  end
end