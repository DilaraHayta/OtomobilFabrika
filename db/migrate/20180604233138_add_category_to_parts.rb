class AddCategoryToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :category, :string
  end
end
