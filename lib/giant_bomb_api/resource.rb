module GiantBombApi
  module Resource

    def self.extended(base)
      base.instance_variable_set("@mapped_attributes", [])
      base.instance_variable_set("@collection_attributes", [])
      base.include ResourceValueSetter
    end

    def mapped_attribute(*attributes)
      attributes.each do |attribute_name|
        instance_variable_get("@mapped_attributes") << attribute_name

        class_eval do
          attr_accessor attribute_name
        end
      end
    end

    def collection_attribute(*attributes)
      attributes.each do |attribute_name|
        instance_variable_get("@collection_attributes") << attribute_name

        class_eval do
          attr_accessor attribute_name
        end
      end
    end
  end
end