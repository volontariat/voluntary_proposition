module Proposition
  class Unit < ActiveRecord::Base
    self.table_name = 'proposition_units'
    
    include Applicat::Mvc::Model::Resource::Base
    include Applicat::Mvc::Model::Tree
    
    belongs_to :organization
    
    validates :organization_id, presence: true
    validates :name, presence: true, uniqueness: { scope: [:organization_id] }
    
    attr_accessible :name, :parent_id, :organization_id
    
    PARENT_TYPES = ['organization']
  end
end