Rails.application.routes.draw do

  root to: 'articles#index'
  get '/new', to: 'articles#new'
  resources :articles, only: [:show, :new, :create, :edit, :update, :destroy]

end