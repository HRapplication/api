ActiveAdmin.register OffersContent do

permit_params :content, :job_offer_id

  index do
    selectable_column
    id_column
    column :content
    column :job_offer_id
    column :created_at
    actions
  end

  filter :content
  filter :job_offer_id
  filter :created_at

  form do |f|
    f.inputs "Job offer content details" do
      f.input :content
      f.input :job_offer_id
    end
    f.actions
  end


end
