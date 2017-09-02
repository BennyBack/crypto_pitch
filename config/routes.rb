Rails.application.routes.draw do
  root to: 'static#index'
  get 'user/alerts', to: 'alerts#index'
  get 'search', to: 'alerts#index', as: 'search'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'alerts#dashboard', as: 'dashboard'
  resources :users do
    resources :alerts, shallow: true
  end
end
