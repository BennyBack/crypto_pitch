Rails.application.routes.draw do
  root to: 'static#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    resources :alerts, shallow: true
  end
  get 'user/alerts', to: 'alerts#index'
  get 'search', to: 'alerts#index', as: 'search'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'alerts#dashboard', as: 'dashboard'
end
