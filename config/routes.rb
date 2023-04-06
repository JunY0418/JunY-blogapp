Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  get '/new', to: 'articles#new'
  resources :articles
end
