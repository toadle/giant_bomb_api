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

    def each_page(sort: {}, limit: 100, offset: 0, should_rate_limit: false, rate_per_hour: 200)
      rate_limit(should_rate_limit, rate_per_hour) do
        response = where(sort: sort, limit: limit, offset: offset, tries: 5)
        yield response
        offset += limit
        break unless response.has_more_results?
      end
    end

    def find(id, params = {})
      GiantBombApi.client.send_request(Request::Detail.new(resource_name, id, params))
    end

    def where(params = {})
      return GiantBombApi.client.send_request(Request::Collection.new(self)) unless params.present?

      sort = params[:sort]
      limit = params[:limit]
      offset = params[:offset]
      tries ||= (params[:tries] || 0)

      args = {}
      args[:filter] = params.reject {|key,value| %i(sort limit offset tries).include?(key) }
      args[:sort] = sort if sort.present?
      args[:limit] = limit if limit.present?
      args[:offset] = offset if offset.present?

      GiantBombApi.client.send_request(Request::Collection.new(self, args))
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
      if (tries -= 1) > 0
        sleep 5
        retry
      end

      raise e
    end

    private

    def rate_limit(should_rate_limit, rate_per_hour, &block)
      started_at = Time.now
      num_of_requests = 0

      loop do
        t1 = Time.now
        block.call
        num_of_requests += 1
        t2 = Time.now

        if should_rate_limit
          if t2 - started_at >= 1.hour
            started_at = Time.now
            num_of_requests = 0
          end

          request_time = t2 - t1
          time_to_one_hour = (started_at + 1.hour) - t2
          remaining_requests = rate_per_hour - num_of_requests
          min_time_per_request = if remaining_requests == 0
                                   time_to_one_hour
                                 else
                                   time_to_one_hour / remaining_requests
                                 end

          sleep(min_time_per_request - request_time) if request_time < min_time_per_request
        end
      end
    end

  end
end
