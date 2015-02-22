module GiantBombApi
  module CollectionResource

    def self.extended(base)
      base.extend Resource
    end

    def collection_resource_name(collection_resource_name = nil)
      if collection_resource_name.present?
        self.instance_variable_set("@collection_resource_name", collection_resource_name)
      end
      self.instance_variable_get("@collection_resource_name") || self.resource_name.pluralize
    end

    def all(sort = {})
      where(sort: sort)
    end

    def find(id, params = {})
      GiantBombApi.client.send_request(Request::Detail.new(resource_name, id, params))
    end

    def where(params = {})
      return GiantBombApi.client.send_request(Request::Collection.new(self)) unless params.present?

      sort = params[:sort]
      limit = params[:limit]
      offset = params[:offset]

      args = {}
      args[:filter] = params.reject {|key,value| %i(sort limit offset).include?(key) }
      args[:sort] = sort if sort.present?
      args[:limit] = limit if limit.present?
      args[:offset] = offset if offset.present?

      GiantBombApi.client.send_request(Request::Collection.new(self, args))
    end

  end
end