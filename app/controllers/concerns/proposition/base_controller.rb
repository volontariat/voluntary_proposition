module Proposition
  module BaseController
    extend ActiveSupport::Concern
      
    def application_navigation
      :main_proposition
    end
    
    def navigation_product_path
      proposition_product_path
    end
    
    def navigation_product_name
      'Proposition'
    end
  end
end