Rails.application.routes.draw do
  get 'employee/index'

  get 'employee/show'

  get 'employee/create'

  get 'employee/destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :offers
  resources :employees

  root 'home#index'
end
