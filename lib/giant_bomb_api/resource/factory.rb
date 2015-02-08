require 'active_support/inflector'

module GiantBombApi
  class Resource::Factory

    def self.init_resource_from(json)
      api_detail_url = json["api_detail_url"]
      return if api_detail_url.nil?

      resource_name = discover_resource_name(api_detail_url)
      return if resource_name.nil?

      init_object(resource_name, json)
    end

    private

    def self.init_object(resource_name, json)
      constant_name = "GiantBombApi::Resource::#{resource_name.to_s.classify}"
      if Object.const_defined? constant_name
        constant_name.constantize.new(json)
      end
    end

    def self.discover_resource_name(string)
      match_data = string.match("/api/(?<resource_name>[a-z_]*)/")
      return if match_data.nil?
      return match_data["resource_name"]
    end

    private

  end
end