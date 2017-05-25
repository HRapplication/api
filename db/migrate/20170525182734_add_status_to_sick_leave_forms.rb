class AddStatusToSickLeaveForms < ActiveRecord::Migration
  def change
    add_column :sick_leave_forms, :status, :integer
  end
end
