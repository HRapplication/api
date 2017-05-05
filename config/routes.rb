Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :offers, only: [:index, :show, :create, :delete]

  root 'home#index'
end
