class AddDueDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :duedate, :datetime
  end
end
