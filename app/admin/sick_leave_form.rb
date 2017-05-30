ActiveAdmin.register SickLeaveForm do

permit_params :start_date, :end_date, :care_type, :status, :employee_id

  index do
    selectable_column
    id_column
    column :start_date
    column :end_date
    column :care_type
    column :employee_id
    column :status
    column :created_at
    actions
  end

  filter :start_date
  filter :end_date
  filter :care_type
  filter :employee_id
  filter :status
  filter :created_at

  form do |f|
    f.inputs "Sick leave forms details" do
      f.input :start_date
      f.input :end_date
      f.input :status, as: :select, collection:  SickLeaveForm.statuses.keys
      f.input :care_type, as: :select, collection:  SickLeaveForm.care_types.keys
      f.input :employee_id
    end
    f.actions
  end


end
