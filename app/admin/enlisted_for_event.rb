ActiveAdmin.register EnlistedForEvent do

permit_params :event_id, :employee_id

  index do
    selectable_column
    id_column
    column :event_id
    column :employee_id
    column :created_at
    actions
  end

  filter :event_id
  filter :employee_id
  filter :created_at

  form do |f|
    f.inputs "Enlisted for events details" do
      f.input :event_id
      f.input :employee_id
    end
    f.actions
  end


end
