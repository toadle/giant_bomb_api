require 'active_support/core_ext/object'

module GiantBombApi
  class Response
    extend GiantBombApi::Resource

    resource_attribute :limit, :offset, :number_of_page_results, :number_of_total_results, :results

    private
    
  end
end