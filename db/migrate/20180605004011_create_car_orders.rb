class CreateCarOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :car_orders do |t|
      t.string :customer
      t.date :orderDate
      t.date :deliveryDate
      t.string :adet
      t.string :fiyat
      t.boolean :status

      t.timestamps
    end
  end
end
