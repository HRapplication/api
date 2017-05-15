class ChangeScheduleReferenve < ActiveRecord::Migration
  def change
    remove_column :schedules, :employee_id, :integer
    add_reference :schedules, :user, index: true, foreign_key: true
  end
end
