Rails.application.routes.draw do
  resources :warehouse_changes
  resources :sale_products

  resources :sales
  post 'sale_disable/:id', to: "sales#disable", as: 'sale_disable'
  get 'start_new_sale', to: "sales#start_new_sale"

  resources :reasons
  root 'welcome#index'
  resources :products

  get 'reports', to: 'reports#index'
  get 'reports_sales', to: 'reports#sales'
  get 'reports_products', to: 'reports#products'
  get 'reports_warehouse_changes', to: 'reports#warehouse_changes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
