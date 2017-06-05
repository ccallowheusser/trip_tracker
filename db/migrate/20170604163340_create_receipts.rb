class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :payee
      t.date :receiptDate
      t.string :location
      t.float :amount
      t.string :memo
      t.string :category
      t.boolean :reimbursable

      t.belongs_to :trip
      
      t.timestamps
    end
  end
end
