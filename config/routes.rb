Rails.application.routes.draw do
  resources :instructions
  resources :owners
  resources :vets
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
