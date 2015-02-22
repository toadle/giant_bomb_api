module GiantBombApi
  module Resource

    def self.extended(base)
      base.instance_variable_set("@resource_attributes", {})
      base.include ResourceValueSetter
    end

    def resource_name(resource_name = nil)
      if resource_name.present?
        self.instance_variable_set("@resource_name", resource_name)
      end
      self.instance_variable_get("@resource_name") || self.name.split('::').last.underscore
    end

    def find(id, params = {})
      GiantBombApi.client.send_request(Request::Detail.new(resource_name, id, params))
    end

    def resource_attribute(*attributes, resource_name: nil)
      attributes.each do |attribute_name|
        instance_variable_get("@resource_attributes")[attribute_name] = resource_name

        class_eval do
          attr_accessor attribute_name
        end
      end
    end
  end
end