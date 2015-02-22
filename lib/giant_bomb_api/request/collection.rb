module GiantBombApi
  class Request::Collection < GiantBombApi::Request

    def initialize(resource, filter: {}, sort: {}, limit: 100, offset: 0)
      @resource = resource
      @filter = filter
      @sort = sort
      
      params = {}
      params[:filter] = filter_params if filter_params.present?
      params[:sort] = sort_params if sort_params.present?
      params[:limit] = limit if limit.present?
      params[:offset] = offset if offset.present?

      super end_point, params
    end

    def filter_params
      params_join @filter
    end

    def sort_params
      params_join @sort
    end

    def end_point
      @resource.collection_resource_name
    end

    private 

    def params_join(params)
      params.map { |key,value| "#{key}:#{value}" }.join(",")
    end
  end
end
