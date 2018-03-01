Rails.application.routes.draw do
  root "pages#index"
  get "/home" => "pages#show"
  

 delete "/logout" => "sessions#destroy", as: :logout
 resources :sessions, only: [:new, :create]

  # post '/users/:id/clear-backpack' => "users#clear_backpack", as: :clear_backpack
  # post '/users/:id/add-to-backpack' => 'users#add_to_backpack', as: :add_to_backpack1
  resources :users

  post '/gears/:id/backpack' => 'gears#add_to_backpack', as: :add_to_backpack
  delete '/gears/backpack' => "gears#clear_backpack", as: :remove_from_backpack
  # delete '/gears/:id/backpack' => "gears#clear_backpack", as: :remove_from_backpack

  resources :gears

  # get '/gears/name' => 'gears#name_view'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
