Rails.application.routes.draw do
  devise_for :users
  root to: "fishes#index"

  resources :fishes do
    resources :breeds, only: [:edit, :update]
  end
end
