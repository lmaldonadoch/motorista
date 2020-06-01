Rails.application.routes.draw do
  resources :articles
  resources :users
  root to: 'articles#index'

  get '/sign_in', to: 'users#sign_in_form'
  post '/sign_in', to: 'users#sign_in'
  get '/sign_out', to: 'users#sign_out'
end
