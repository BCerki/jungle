class AddProductsToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :products, index: true
  end
end
