Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'users/:id', to: 'users#show', as: 'user'
  post 'room/create', to: 'users#user_room', as: 'user_room'
  resources :rooms do
    resources :messages
  end
end
