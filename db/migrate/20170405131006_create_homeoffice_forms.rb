class CreateHomeofficeForms < ActiveRecord::Migration
  def change
    create_table :homeoffice_forms do |t|
      t.date :start_date
      t.date :end_date
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
