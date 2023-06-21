Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'users#index'
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create]

  post 'comments/new', to: 'comments#create', as: 'create_comment'
  post 'likes/new', to: 'likes#create', as: 'create_like'
end
