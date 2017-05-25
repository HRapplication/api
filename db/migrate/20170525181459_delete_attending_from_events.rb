class DeleteAttendingFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :attending
  end
end
