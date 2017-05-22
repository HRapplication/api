Rails.application.routes.draw do
  get 'users/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users


  resources :events do
    post "/enlist", to: 'events#enlist'
  end
  resources :schedules
  resources :offers
  resources :employees
  resources :users, only: [:index]


  root 'home#index'
end
