Rails.application.routes.draw do
  get 'order_menu/inde'
  get 'categories/index'
  get 'menus/index'
  get 'orders/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :menus
  resources :orders
end
