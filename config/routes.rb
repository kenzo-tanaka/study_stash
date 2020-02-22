Rails.application.routes.draw do
  namespace :admin do
    resources :portfolios
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: :show
  resources :schedules
  get '/dashboard' => 'schedules#dashboard'
  get '/login' => 'users#login'
  root 'schedules#index'
end
