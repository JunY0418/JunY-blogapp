Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  get '/new', to: 'articles#new'
  resources :articles do
    resources :comments, only: [:new, :create]
  end

  resource :profile, only: [:show, :edit, :update]
end
