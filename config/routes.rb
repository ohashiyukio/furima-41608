Rails.application.routes.draw do
  #get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root to:"items#index"
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  resources :items, only: [:index, :new, :create]
end

