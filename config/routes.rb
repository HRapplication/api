Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :events do
    post "/enlist", to: 'events#enlist'
    delete "/enlist", to: 'events#unroll'
  end

  resources :business_trip_forms, :except => :show
  get 'business_trip_forms/all', to: "business_trip_forms#all"

  resources :holiday_forms, :except => :show
  get 'holiday_forms/all', to: "holiday_forms#all"

  resources :sick_leave_forms, :except => :show
  get 'sick_leave_forms/all', to: "sick_leave_forms#all"

  resources :homeoffice_forms, :except => :show
  get 'homeoffice_forms/all', to: "homeoffice_forms#all"

  resources :schedules
  resources :offers
  resources :employees
  patch "/update_user", to: 'employees#update_user'

  resources :users, only: [:index]


  root 'home#index'
end
