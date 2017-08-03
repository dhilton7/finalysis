class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :status, null: false, default: 'prospect'
      t.text :notes, null: true
      t.timestamps
    end
  end
end
