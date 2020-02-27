Rails.application.routes.draw do
  resources :tags, only: :show
  resources :portfolios, only: [:index, :show]
  namespace :admin do
    resources :portfolios
    resources :books, except: :show
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: :show
  resources :schedules
  resources :comments
  get '/dashboard' => 'schedules#dashboard'
  get '/login' => 'users#login'
  root 'schedules#index'
end
