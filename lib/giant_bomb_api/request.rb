module GiantBombApi
  class Request
    attr_accessor :params, :end_point

    def initialize(end_point, params)
      @params = params
      @end_point = end_point
    end
  end
end
