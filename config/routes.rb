Rails.application.routes.draw do
  resources :tags, only: :show
  resources :portfolios, only: [:index, :show]
  namespace :admin do
    resources :portfolios
    resources :books

    root 'portfolios#index'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: :show
  resources :schedules
  resources :comments
  resources :blogs, except: :index
  resources :articles
  resources :books, only: [:index, :show]
  get '/dashboard' => 'schedules#dashboard'
  get '/login' => 'users#login'
  root 'schedules#index'
end
