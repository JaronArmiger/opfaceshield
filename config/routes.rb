Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  root 'static_pages#home'
  resources :accounts, except: [:index, :destroy]
  resources :addresses, except: [:index, :show]
  resources :orders
end
