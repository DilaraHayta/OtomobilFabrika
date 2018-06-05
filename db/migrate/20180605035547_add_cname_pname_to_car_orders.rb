class AddCnamePnameToCarOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :car_orders, :cname, :string
    add_column :car_orders, :pname, :string
  end
end
