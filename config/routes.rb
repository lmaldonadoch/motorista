Rails.application.routes.draw do
  resources :articles
  resources :users
  root to: 'articles#index'

  get '/sign_in', to: 'users#sign_in_form'
  post '/sign_in', to: 'users#sign_in'
  get '/sign_out', to: 'users#sign_out'

  get '/cars', to: 'articles#articles_by_category', category: 'cars'
  get '/bikes', to: 'articles#articles_by_category', category: 'bikes'
  get '/offroad', to: 'articles#articles_by_category', category: 'offroad'
  get '/racing', to: 'articles#articles_by_category', category: 'racing'

  get '/vote', to: 'articles#vote'
end
