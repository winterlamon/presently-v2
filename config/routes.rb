Rails.application.routes.draw do
  resources :user_categories
  resources :products
  resources :categories
  resources :users

  get '/', to: 'static#home', as: 'home_path'
  root to: 'static#home'

end
