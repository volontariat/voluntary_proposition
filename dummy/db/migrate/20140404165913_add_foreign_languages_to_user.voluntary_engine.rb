# This migration comes from voluntary_engine (originally 20121007071543)
class AddForeignLanguagesToUser < ActiveRecord::Migration
  def change
    remove_column :users, :foreign_language
    add_column :users, :foreign_languages, :text
  end
end
