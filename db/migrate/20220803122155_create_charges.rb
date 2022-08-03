class CreateCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :charges do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.boolean :disputed

      t.timestamps
    end
  end
end
