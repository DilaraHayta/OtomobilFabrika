class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :desc
      t.string :name
      t.string :price
      t.string :part_no

      t.timestamps
    end
  end
end
