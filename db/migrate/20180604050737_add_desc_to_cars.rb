class AddDescToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :desc, :string
  end
end
