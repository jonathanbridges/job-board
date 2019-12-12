Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'openings#index'

  resources :users, only: [:new, :create, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :openings, only: [:new, :create, :index, :edit, :update]
  resources :companies, only: [:new, :create, :index]
  resources :applications, only: [:create, :index]

end
