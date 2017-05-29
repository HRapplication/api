ActiveAdmin.register HomeofficeForm do

  permit_params :start_date, :end_date, :status, :employee_id

  index do
    selectable_column
    id_column
    column :start_date
    column :end_date
    column :employee_id
    column :status
    column :created_at
    actions
  end

  filter :start_date
  filter :end_date
  filter :employee_id
  filter :status
  filter :created_at

  form do |f|
    f.inputs "Homeoffice forms details" do
      f.input :start_date
      f.input :end_date
      f.input :status, as: :select, collection:  HomeofficeForm.statuses.keys
      f.input :employee_id
    end
    f.actions
  end


end
