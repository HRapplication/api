class CreateHolidayForms < ActiveRecord::Migration
  def change
    create_table :holiday_forms do |t|
      t.date :start_date
      t.date :end_date
      t.integer :holiday_type
      t.text :comment
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
