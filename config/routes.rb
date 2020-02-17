Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/login' => 'users#login'
  resources :schedules
  root 'schedules#index'
end
