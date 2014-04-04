class AddPropositionProduct < ActiveRecord::Migration
  def up
    if product = Product.where(name: 'Proposition').first
    else
      Product.create(name: 'Proposition', text: 'Product about proposition development process with delegated voting system (Liquid Democracy)') 
    end
  end
  
  def down
    product.destroy if product = Product.where(name: 'Proposition').first
  end
end
