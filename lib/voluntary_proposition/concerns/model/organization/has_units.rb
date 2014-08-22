module VoluntaryProposition
  module Concerns
    module Model
      module Organization
        module HasUnits
          extend ActiveSupport::Concern
          
          included do
            has_many :proposition_units, class_name: 'Proposition::Unit', dependent: :destroy
          end
        end
      end
    end
  end
end