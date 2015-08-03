class AddPropositionProduct < ActiveRecord::Migration
  def up
    if product = Product::Proposition.first
    else
      Product::Proposition.create(name: 'Proposition', text: 'Product about proposition development process with delegated voting system (Liquid Democracy)') 
    end
  end
  
  def down
    product.destroy if product = Product::Proposition.first
  end
end
