Rails.application.routes.draw do
  root "static#index"
  get 'signup', to: "users#new"
  get 'about', to: "static#about", as: "about"
  # get 'user/alerts', to: 'alerts#index'
  get 'search', to: 'alerts#index'
  get 'dashboard', to: 'alerts#dashboard'
  
  post 'signup',  to: 'users#create'
  
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    resources :alerts, shallow: true
  end
end