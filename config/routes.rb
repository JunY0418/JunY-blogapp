Rails.application.routes.draw do
  root to: 'articles#index'
  get '/new', to: 'articles#new'
  resources :articles
end
