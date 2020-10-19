Rails.application.routes.draw do
  get 'top/index'
  get 'top/show'
  get 'users/show'
  devise_for :users
  resources :books do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  root 'books#index'
  patch 'notifications/admit' => 'rooms#admit' ,as:'room_admit'
  get 'notifications/deny'
  resources :users, only: [:show, :edit, :update, :index]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :notifications, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end