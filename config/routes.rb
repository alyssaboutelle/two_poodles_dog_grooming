Rails.application.routes.draw do
  resources :authorized_associates
  resources :saved_appointments
  resources :services
  resources :dog_profiles
  resources :dog_owner_profiles
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
