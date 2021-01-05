Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users
  
  resources :colaborattors

  resources :parkings 
  resources :sectors
  resources :offices
  resources :daily_hours
  resources :bonds
  resources :schedules
  resources :functions
  resources :financials
  resources :users

  get 'graphics/index'
  get 'zip_code', to:'zip_code#show'
  get 'search', to: 'search#index'
  get 'welcome/index'
  get 'profile', to:'profile#edit'
  patch 'profile', to:'profile#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
