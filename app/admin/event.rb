ActiveAdmin.register Event do

permit_params :title, :spots, :place, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :spots
    column :place
    column :user_id
    column :created_at
    actions
  end

  filter :title
  filter :spots
  filter :place
  filter :user_id
  filter :created_at

  form do |f|
    f.inputs "Event details" do
      f.input :title
      f.input :spots
      f.input :place
      f.input :user_id
    end
    f.actions
  end


end
