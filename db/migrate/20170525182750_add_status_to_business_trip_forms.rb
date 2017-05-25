class AddStatusToBusinessTripForms < ActiveRecord::Migration
  def change
    add_column :business_trip_forms, :status, :integer
  end
end
