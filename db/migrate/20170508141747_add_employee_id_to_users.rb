class AddEmployeeIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :employee, index: true, foreign_key: true
    remove_reference :employees, :user
  end
end
