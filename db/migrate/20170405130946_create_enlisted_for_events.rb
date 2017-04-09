class CreateEnlistedForEvents < ActiveRecord::Migration
  def change
    create_table :enlisted_for_events do |t|
      t.references :event, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
