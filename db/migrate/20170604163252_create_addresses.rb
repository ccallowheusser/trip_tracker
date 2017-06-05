class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :siteName, null: false
      t.float :latitude
      t.float :longitude
      t.string :streetAddress
      t.string :city
      t.string :state
      t.integer :zip5

      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
