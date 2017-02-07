Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'pages/about', to: 'pages#about'

  resources :articles

  get 'singup', to: 'users#new'
  resources :users, except: [:new] # post 'users', to: 'users#create'
end
