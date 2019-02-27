Rails.application.routes.draw do
  root "doctors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
  end
