class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :amount 						    # stored as cents
      t.string :account
      t.string :description, null: true
      t.date :date
      t.references :property, index: true
      # t.references :entry_category, index: true
      # t.references :sheet, index: true
      t.timestamps
    end
  end
end
