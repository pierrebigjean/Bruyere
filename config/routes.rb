Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  
  root to: 'pages#home'
  get "plant_home", to: 'pages#plant_home'

  resources :plants, only: [ :index ] do
    resources :ownerships, only: [ :create, :destroy ]
  end

  resources :locations, only: [ :index, :create, :update, :destroy ]

end
