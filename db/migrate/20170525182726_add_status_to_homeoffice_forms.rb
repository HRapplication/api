class AddStatusToHomeofficeForms < ActiveRecord::Migration
  def change
    add_column :homeoffice_forms, :status, :integer
  end
end
