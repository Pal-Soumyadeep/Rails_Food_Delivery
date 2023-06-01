Rails.application.routes.draw do
  get "about", to: "about#index"
  root to: 'home#index'
  resources :users
  resources :restaurants do
    resources :menus
  end

  get "detail", to: "users#show"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
