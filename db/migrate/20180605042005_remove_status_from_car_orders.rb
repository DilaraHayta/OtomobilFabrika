class RemoveStatusFromCarOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :car_orders, :status, :boolean
    add_column :car_orders, :status, :string
  end
end
