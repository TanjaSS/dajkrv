Rails.application.routes.draw do

  root "homepage#index"
  resources :users, only: [:new, :create, :destroy]
  resource :login, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end
end
