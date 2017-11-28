Rails.application.routes.draw do

  get 'logins/new'

  root "homepage#index"
  resources :users, only: [:new, :create]
  resource :login, only: [:new, :create, :destroy]
end
