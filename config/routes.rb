Rails.application.routes.draw do
  root "static#index"
  get '/signup', to: "users#new"
  post '/signup',  to: "users#create"
  get 'about', to: "static#about", as: "about"
  get 'search', to: 'alerts#search'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  resources :users do
  end
  resources :alerts
end
