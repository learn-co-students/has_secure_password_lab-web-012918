Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/welcome' => 'users#welcome', as: 'welcome'
  resource :users, only: [:new, :create]

end
