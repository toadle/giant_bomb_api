module GiantBombApi
  class Resource::Factory

    MATCHERS = []
    MATCHERS << {resource_name: :game,     regexp: /api\/game/}

    def self.init_resource_from(json)
      api_detail_url = json["api_detail_url"]
      return if api_detail_url.nil?

      matcher = find_match(api_detail_url)
      return if matcher.nil?

      init_object(matcher[:resource_name], json)
    end

    private

    def self.init_object(resource_name, json)
      "Resource::#{resource_name.to_s.classify}".constantize.new(json)
    end

    def self.find_match(string)
      return unless string
      MATCHERS.each do |matcher|
        if string.match(matcher[:regexp])
          return matcher
        end
      end
      return nil
    end

  end
end