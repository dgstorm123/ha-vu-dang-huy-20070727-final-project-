require 'sidekiq/web'

Rails.application.routes.draw do
  resources :inventories
  resources :memberships
  resources :products
  resources :orders
  resources :materials
  
  namespace :admin do
    devise_for :admins
    # các route của admin
    
  end
  resources :items 
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  match '/404', to: 'errors#not_found', via: :all
  root to: 'home#home1'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
