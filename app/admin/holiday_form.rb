ActiveAdmin.register HolidayForm do

permit_params :start_date, :end_date, :holiday_type, :comment, :status, :employee_id

  index do
    selectable_column
    id_column
    column :start_date
    column :end_date
    column :holiday_type
    column :comment
    column :employee_id
    column :status
    column :created_at
    actions
  end

  filter :start_date
  filter :end_date
  filter :holiday_type
  filter :comment
  filter :employee_id
  filter :status
  filter :created_at

  form do |f|
    f.inputs "Holiday forms details" do
      f.input :start_date
      f.input :end_date
      f.input :holiday_type, as: :select, collection:  HolidayForm.holiday_types.keys
      f.input :comment
      f.input :status, as: :select, collection:  HolidayForm.statuses.keys
      f.input :employee_id
    end
    f.actions
  end


end
