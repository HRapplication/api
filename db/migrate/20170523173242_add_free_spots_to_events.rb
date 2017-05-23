class AddFreeSpotsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :free_spots, :integer
  end
end
