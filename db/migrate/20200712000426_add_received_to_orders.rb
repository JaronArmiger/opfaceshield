class AddReceivedToOrders < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :received, :boolean, default: false
  end
end
