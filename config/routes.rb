Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :index]
  end
  root 'posts#index'
  resources :users, only: [:show]
end
