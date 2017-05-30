ActiveAdmin.register EventsContent do

permit_params :content, :event_id

  index do
    selectable_column
    id_column
    column :content
    column :event_id
    column :created_at
    actions
  end

  filter :content
  filter :event_id
  filter :created_at

  form do |f|
    f.inputs "Events content details" do
      f.input :content
      f.input :event_id
    end
    f.actions
  end


end
