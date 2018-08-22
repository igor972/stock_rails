Rails.application.routes.draw do
  get 'sale/index'
  get 'sale/show'
  get 'sale/new'
  get 'sale/create'
  get 'sale/destroy'
  resources :warehouse_changes
  resources :sale_products
  resources :reasons
  root 'welcome#index'
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
