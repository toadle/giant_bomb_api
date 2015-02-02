module GiantBombApi
  class Request::Search < GiantBombApi::Request
    ENDPOINT = '/search'

    def initialize(query, resources: [GiantBombApi::Resource::Game], limit: 100, page: 1)
      params = {
        query: query,
        resources: resources.map { |clazz| clazz.name.split('::').last.downcase }.join(','),
        limit: limit,
        page: page
      }
      super ENDPOINT, params
    end
  end
end
