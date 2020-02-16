Rails.application.routes.draw do
  devise_for :users
  resources :schedules
  root 'schedules#index'
end
