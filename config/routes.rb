Rails.application.routes.draw do
  devise_for :users
  root to: "fishes#index"

  resources :fishes, only: [:index, :new, :create, :show, :edit, :update] do
    resources :breeds, only: [:edit, :update]
  end
end
