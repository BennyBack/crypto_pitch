Rails.application.routes.draw do
  root to: 'static#index'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    resources :alerts
  end
  get 'search', to: 'alerts#index', as: 'search'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'static#dashboard', as: 'dashboard'
end
