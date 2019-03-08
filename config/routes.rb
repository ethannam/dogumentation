Rails.application.routes.draw do
  resources :instructions
  resources :users, except: [:new]
  resources :vets
  resources :dogs, except: [:show, :edit, :update, :destroy]

  root "application#home", as: "home"

  get "/dogs/:username/edit", to: "dogs#edit", as: "edit_dog"
  get "/dogs/:username", to: "dogs#show", as: "dog"
  patch "/dogs/:username", to: "dogs#update"
  delete "/dogs/:username", to: "dogs#destroy"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get "/logout", to: "sessions#new"

  get "/register", to: "users#new", as: "new_user"
end
