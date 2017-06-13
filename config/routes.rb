Rails.application.routes.draw do
  get 'users/index'

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :events do
    post "/enlist", to: 'events#enlist'
    delete "/enlist", to: 'events#unroll'
  end
  get 'user_events', to: 'events#all'

  get 'forms/combined', to: "forms#combined"
  get 'forms/user_combined', to: "forms#user_combined"

  resources :business_trip_forms, :except => :show do
    get 'form', to: "business_trip_forms#pdf_template"
  end
  get 'business_trip_forms/all', to: "business_trip_forms#all"

  resources :holiday_forms, :except => :show do
    get 'form', to: "holiday_forms#pdf_template"
  end
  get 'holiday_forms/all', to: "holiday_forms#all"

  resources :sick_leave_forms, :except => :show do
    get 'form', to: "sick_leave_forms#pdf_template"
  end
  get 'sick_leave_forms/all', to: "sick_leave_forms#all"

  resources :homeoffice_forms, :except => :show do
    get 'form', to: "homeoffice_forms#pdf_template"
  end
  get 'homeoffice_forms/all', to: "homeoffice_forms#all"

  resources :offers
  get 'all_offers', to: "offers#all_offers"

  resources :employees
  patch "/update_user", to: 'employees#update_user'

  resources :users, only: [:index] do
    resources :schedules
  end


  root 'home#index'
end
