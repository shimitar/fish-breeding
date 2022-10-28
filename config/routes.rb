Rails.application.routes.draw do
  devise_for :users
  root to: "fishes#index"

  resources :fishes do
    resources :breeds, only: [:edit, :update]
    resources :questions, only: :create
  end

  resources :questions, only: :index do
    resources :answers, only: [:index, :create]
  end
end
