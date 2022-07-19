Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :users, only: [:new, :create, :edit, :update]

  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
