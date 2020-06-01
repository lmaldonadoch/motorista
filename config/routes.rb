Rails.application.routes.draw do
  resources :posts
  resources :users
  
  root to: 'users#index'
end
