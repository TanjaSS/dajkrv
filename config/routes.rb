Rails.application.routes.draw do

  root "homepage#index"
  resources :users, only: [:new, :create]
end
