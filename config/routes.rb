Rails.application.routes.draw do
  root to: 'static#index'
<<<<<<< HEAD
  devise_for :users, :controllers => {sessions:'sessions', registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
=======
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
>>>>>>> 74963c2a2a4079ff19d3d21b24cdb2cd85e61c09
  resources :users do
    resources :alerts, shallow: true
  end
  get 'search', to: 'alerts#index', as: 'search'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'static#dashboard', as: 'dashboard'
end
