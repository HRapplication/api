ActiveAdmin.register BusinessTripForm do

 permit_params :start_date, :end_date, :company, :transport, :status, :employee_id

  index do
    selectable_column
    id_column
    column :start_date
    column :end_date
    column :company
    column :transport
    column :employee_id
    column :status
    column :created_at
    actions
  end

  filter :start_date
  filter :end_date
  filter :company
  filter :transport
  filter :employee_id
  filter :status
  filter :created_at

  form do |f|
    f.inputs "Business trip forms details" do
      f.input :start_date
      f.input :end_date
      f.input :company
      f.input :transport
      f.input :status, as: :select, collection:  BusinessTripForm.statuses.keys
      f.input :employee_id
    end
    f.actions
  end


end
