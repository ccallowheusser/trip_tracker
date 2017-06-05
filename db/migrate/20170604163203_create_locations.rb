class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :locationName, null: false
      t.date :arriveDate, null: false
      t.time :arriveTime, null: false
      t.integer :duration, null: false
      t.integer :milesSinceLast, null: false
      t.string :purpose, null: false
      t.string :secondaryPurpose
      t.boolean :overnight, default: false

      t.belongs_to :trip

      t.timestamps
    end
  end
end
