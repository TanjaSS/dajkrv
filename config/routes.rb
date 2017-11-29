Rails.application.routes.draw do

  root "homepage#index"
  resources :users, only: [:new, :create]
  resource :login, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]
end
