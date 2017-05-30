ActiveAdmin.register JobOffer do

permit_params :title, :is_available, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :is_available
    column :user_id
    column :created_at
    actions
  end

  filter :title
  filter :is_available
  filter :user_id
  filter :created_at

  form do |f|
    f.inputs "Job offer details" do
      f.input :title
      f.input :is_available
      f.input :user_id
    end
    f.actions
  end


end
