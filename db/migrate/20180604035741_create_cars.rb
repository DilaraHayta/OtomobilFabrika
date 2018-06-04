class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :year
      t.string :fuel
      t.string :series
      t.boolean :state

      t.timestamps
    end
  end
end
