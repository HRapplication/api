class AddStatusToHolidayForms < ActiveRecord::Migration
  def change
    add_column :holiday_forms, :status, :integer
  end
end
