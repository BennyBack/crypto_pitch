Rails.application.routes.draw do
  root to: 'static#index'
  resources :users do
    resources :alerts
  end
  get 'search', to: 'alerts#index', as: 'search'
  get 'about', to: 'static#about', as: 'about'
  get 'dashboard', to: 'static#dashboard', as: 'dashboard'
<<<<<<< HEAD
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
=======
   devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
>>>>>>> 3e85cf2e481b4e48c1ddeec7e8c6464c4d201a41
end
