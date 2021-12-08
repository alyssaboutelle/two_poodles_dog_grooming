Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :authorized_associates

      resources :saved_appointments

      resources :services

      resources :dog_profiles

      resources :dog_owner_profiles

      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "dog_owner_profiles#index"
  resources :authorized_associates
  resources :saved_appointments
  resources :services
  resources :dog_profiles
  resources :dog_owner_profiles
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
