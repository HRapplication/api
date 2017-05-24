class AddAttendingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attending, :integer
  end
end
