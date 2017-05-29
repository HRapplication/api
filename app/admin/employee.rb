ActiveAdmin.register Employee do

 permit_params :name, :surname, :phone_number, :position, :weekly_working_hours, :supervisor_id, :user_id

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :phone_number
    column :position
    column :weekly_working_hours
    column :supervisor_id
    column :user_id
    column :created_at
    actions
  end

  filter :name
  filter :surname
  filter :phone_number
  filter :position
  filter :weekly_working_hours
  filter :supervisor_id
  filter :user_id
  filter :created_at

  form do |f|
    f.inputs "Employee details" do
        f.input :name
        f.input :surname
        f.input :phone_number
        f.input :position, as: :select, collection:  Employee.positions.keys
        f.input :weekly_working_hours
        f.input :supervisor_id
        f.input :user_id
    end
    f.actions
  end


end
