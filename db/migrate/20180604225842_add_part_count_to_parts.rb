class AddPartCountToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :part_count, :integer
  end
end
