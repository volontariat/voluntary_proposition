# This migration comes from voluntary_engine (originally 20121004061413)
class AddExtraUserAttributes < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :foreign_language, :string
    add_column :users, :interface_language, :string
    add_column :users, :profession, :string
    add_column :users, :employment_relationship, :string
  end
end
