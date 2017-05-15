class ChangeFieldNameInSchedule < ActiveRecord::Migration
  def change
    rename_column :schedules, :end_gour, :end_hour
  end
end
