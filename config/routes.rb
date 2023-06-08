Rails.application.routes.draw do
  resources :orders

  get "carts/:id", to: "carts#show", as: "cart"
  delete "carts/:id", to: "carts#destroy"

  post "line_items/:id/add", to: "line_items#add_quantity", as: "line_item_add"
  post "line_items/:id/reduce", to: "line_items#reduce_quantity", as: "line_item_reduce"
  post "line_items", to: "line_items#create"
  get "line_items/:id", to: "line_items#show", as: "line_item"
  delete "line_items/:id", to: "line_items#destroy"

  resources :orders

  get "about", to: "about#index"
  root to: 'home#index'
  resources :users
  resources :restaurants do
    resources :menus #do
      # post "line_items/:id/add", to: "line_items#add_quantity", as: "line_item_add"
      # post "line_items/:id/reduce", to: "line_items#reduce_quantity", as: "line_item_reduce"
      # post "line_items", to: "line_items#create"
      # get "line_items/:id", to: "line_items#show", as: "line_item"
      # delete "line_items/:id", to: "line_items#destroy"
    # end
  end

  get "detail", to: "users#show"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
