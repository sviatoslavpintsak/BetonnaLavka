Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :categories
  resources :products  
  resources :carts
  resources :sales
  post 'products/:id/buy', to: 'products#buy', as: 'buy_product'
  get 'carts/current_order', to: 'carts#current_order', as: 'current_order'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  

  #get 'admin', to: 'admin#index' 
end
