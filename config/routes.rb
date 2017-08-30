Rails.application.routes.draw do
  root to: 'static#index'
  devise_for :users, :controllers => {:sessions => "users/sessions" :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    resources :alerts, shallow: true
  end
  get 'user/alerts', to: 'alerts#index'
  get 'search', to: 'alerts#index', as: 'search'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'static#dashboard', as: 'dashboard'
end
