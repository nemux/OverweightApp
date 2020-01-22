Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users
  resources :json, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'report' => 'report#index'
end
