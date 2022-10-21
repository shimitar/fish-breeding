Rails.application.routes.draw do
  devise_for :users
  root to: "fishes#index"

  resources :fishes, only: [:index, :new, :create] do
     resources :breedings, only: :create
  end
end
