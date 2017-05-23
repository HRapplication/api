class ChangeFieldNameInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :free_spots, :spots
  end
end
