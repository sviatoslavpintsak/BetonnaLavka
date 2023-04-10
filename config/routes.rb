Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :products  
  resources :carts
  post 'products/:id/buy', to: 'products#buy', as: 'buy_product'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
 
  #get 'admin', to: 'admin#index' 
end
