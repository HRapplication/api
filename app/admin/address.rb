ActiveAdmin.register Address do

 permit_params :country, :city, :address, :postcode, :employee_id

  index do
    selectable_column
    id_column
    column :country
    column :city
    column :address
    column :postcode
    column :employee_id
    column :created_at
    actions
  end

  filter :country
  filter :city
  filter :address
  filter :postcode
  filter :employee_id
  filter :created_at

  form do |f|
    f.inputs "Address details" do
      f.input :country
      f.input :city
      f.input :address
      f.input :postcode
      f.input :employee_id
    end
    f.actions
  end


end
