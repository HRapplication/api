Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :events do
    post "/enlist/:event_id", to: 'events#enlist'
  end
  resources :offers
  resources :employees

  root 'home#index'
end
