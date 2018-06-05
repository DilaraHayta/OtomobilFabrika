class Carandparts < ActiveRecord::Migration[5.0]
  def change
    add_reference :car_orders, :car, foreign_key: true
    add_reference :car_orders, :part, foreign_key: true
  end
end
