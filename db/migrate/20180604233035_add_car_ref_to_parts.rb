class AddCarRefToParts < ActiveRecord::Migration[5.0]
  def change
    add_reference :parts, :car, foreign_key: true
  end
end
