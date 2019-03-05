Rails.application.routes.draw do
  resources :instructions
  resources :users
  resources :vets
  resources :dogs, except: [:show, :edit, :update, :destroy]
  get "/dogs/:username/edit", to: "dogs#edit", as: "edit_dog"
  get "/dogs/:username", to: "dogs#show", as: "dog"
  patch "/dogs/:username", to: "dogs#update"
  delete "/dogs/:username", to: "dogs#show"
end
