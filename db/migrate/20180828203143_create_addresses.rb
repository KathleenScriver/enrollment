class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :description
      t.text :street_address
      t.text :city
      t.string :state
      t.text :zip_code
      t.timestamps
      t.references :student, foreign_key: true
    end
  end
end
