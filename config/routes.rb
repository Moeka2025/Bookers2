Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end