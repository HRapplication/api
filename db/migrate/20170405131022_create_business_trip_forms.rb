class CreateBusinessTripForms < ActiveRecord::Migration
  def change
    create_table :business_trip_forms do |t|
      t.date :start_date
      t.date :end_date
      t.string :company
      t.string :transport
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
