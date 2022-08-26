Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  namespace :api do
    resources :users, only: %i[create index]
    resources :bookmarks
    resources :ebooks
    resources :order_details
    resources :orders
    resources :products
    resources :customers
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end