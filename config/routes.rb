Rails.application.routes.draw do
  resources :user_categories
  resources :products
  resources :categories
  resources :users
  resources :user_products
  resources :friendships

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/', to: 'static#home', as: 'home_path'

  root to: 'static#home'

end
