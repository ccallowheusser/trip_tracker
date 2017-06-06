class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :travelers, null: false
      t.date :departDate, null: false
      t.time :departTime, null: false
      t.date :returnDate
      t.time :returnTime
      t.integer :numNights, null: false
      t.float :totalCost, default: 0.0
      t.float :totalMileage, default: 0.0
      
      t.timestamps
    end
  end
end
