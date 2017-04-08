class CreateSickLeaveForms < ActiveRecord::Migration
  def change
    create_table :sick_leave_forms do |t|
      t.date :start_date
      t.date :end_date
      t.string :care_type
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
