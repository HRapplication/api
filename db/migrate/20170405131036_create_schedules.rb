class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :work_date
      t.time :start_hour
      t.time :end_gour
      t.boolean :is_weekend
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
