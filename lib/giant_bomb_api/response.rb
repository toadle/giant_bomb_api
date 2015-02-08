require 'active_support/core_ext/object'

module GiantBombApi
  class Response
    extend GiantBombApi::Resource

    mapped_attribute :limit, :offset, :number_of_page_results, :number_of_total_results
    collection_attribute :results

    private
    
  end
end