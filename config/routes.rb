Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users
  
  resources :colaborattors, except: [:show]

  resources :parkings 
  resources :sectors, except: [:show]
  resources :offices, except: [:show]
  resources :daily_hours, except: [:show]
  resources :bonds, except: [:show]
  resources :schedules, except: [:show]
  resources :functions, except: [:show]
  resources :financials, except: [:show]
  resources :users, except: [:show]

  get 'graphics/index'
  get 'zip_code', to:'zip_code#show'
  get 'welcome/index'
  get 'profile', to:'profile#edit'
  patch 'profile', to:'profile#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
