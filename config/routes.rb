Rails.application.routes.draw do
  root "books#index"

  devise_for :users

  resources :users do
    member do
      get :likes
    end
  end

  resources :books do
    resources :reviews, except: :index
  end
  
  # root "books#favorite"
  resources :reviews, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end