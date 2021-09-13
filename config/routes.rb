Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  
  root to: 'pages#home'

  resources :plants, only: [ :index ]

  resources :locations, only: [ :index, :create, :update, :destroy ] do
    resources :ownerships, only: [ :create, :destroy ]
  end

end
