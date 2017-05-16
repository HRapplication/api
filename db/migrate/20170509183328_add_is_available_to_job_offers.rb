class AddIsAvailableToJobOffers < ActiveRecord::Migration
  def change
    add_column :job_offers, :is_available, :boolean
  end
end
