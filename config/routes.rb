Rails.application.routes.draw do
  root "products#index"
  resources :products 
  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
 
  #get 'admin', to: 'admin#index' 
end
