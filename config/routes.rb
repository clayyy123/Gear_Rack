Rails.application.routes.draw do
  root "pages#index"
  get "/home" => "pages#show"
  

 delete "/logout" => "sessions#destroy", as: :logout
 resources :sessions, only: [:new, :create]

  
  resources :users

  resources :gears

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
