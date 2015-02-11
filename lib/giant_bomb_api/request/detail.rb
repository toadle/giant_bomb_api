module GiantBombApi
  class Request::Detail < GiantBombApi::Request

    def initialize(resource_name, id, params = {})
      super "#{resource_name}/#{id}", params
    end

  end
end
