class AddNameToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :name, :string
  end
end