class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :address
      t.string :postcode
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
