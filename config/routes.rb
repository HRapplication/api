Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users


  resources :events do
    post "/enlist", to: 'events#enlist'
  end
  resources :schedules
  resources :offers
  resources :employees

  root 'home#index'
end
