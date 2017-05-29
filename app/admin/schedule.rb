ActiveAdmin.register Schedule do

permit_params :work_date, :start_hour, :end_hour, :is_weekend, :employee_id

  index do
    selectable_column
    id_column
    column :work_date
    column :start_hour
    column :end_hour
    column :is_weekend
    column :employee_id
    column :created_at
    actions
  end

    filter :work_date
    filter :start_hour
    filter :end_hour
    filter :is_weekend
    filter :employee_id
    filter :created_at

  form do |f|
    f.inputs "Schedule forms details" do
      f.input :work_date
      f.input :start_hour
      f.input :end_hour
      f.input :is_weekend
      f.input :employee_id
    end
    f.actions
  end


end
