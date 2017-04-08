class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :surname
      t.string :phone_number
      t.integer :position
      t.integer :weekly_working_hours
      t.integer :supervisor_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
