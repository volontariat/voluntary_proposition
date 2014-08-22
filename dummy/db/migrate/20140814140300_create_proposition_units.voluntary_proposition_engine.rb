# This migration comes from voluntary_proposition_engine (originally 20140814140019)
class CreatePropositionUnits < ActiveRecord::Migration
  def change
    create_table :proposition_units do |t|
      t.integer :organization_id
      t.string :ancestry
      t.integer :ancestry_depth, default: 0
      t.integer :position
      t.string :name
      t.timestamps
    end
    
    add_index :proposition_units, :ancestry
  end
end
