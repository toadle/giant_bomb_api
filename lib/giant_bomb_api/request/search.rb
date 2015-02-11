module GiantBombApi
  class Request::Search < GiantBombApi::Request

    def initialize(query, resources: [GiantBombApi::Resource::Game], limit: 100, page: 1)
      params = {
        query: query,
        resources: resources.map { |res| res.resource_name }.join(','),
        limit: limit,
        page: page
      }
      super end_point, params
    end

    def end_point
      '/search'
    end
  end
end
