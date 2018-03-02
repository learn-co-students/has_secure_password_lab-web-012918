Rails.application.routes.draw do

  root 'users#welcome'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]


end
