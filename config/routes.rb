Rails.application.routes.draw do
  root to: 'static#index'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'static#dashboard', as: 'dashboard'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
