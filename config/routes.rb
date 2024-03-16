Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'users/:id', to: 'users#show', as: 'user'
  resources :rooms do
    resources :messages
  end
end
