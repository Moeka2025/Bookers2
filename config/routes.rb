Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
end