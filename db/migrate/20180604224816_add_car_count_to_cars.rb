class AddCarCountToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_count, :integer
  end
end
