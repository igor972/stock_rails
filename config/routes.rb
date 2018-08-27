Rails.application.routes.draw do
  resources :warehouse_changes
  resources :sale_products
  resources :sales
  get 'start_new_sale', to: "sales#start_new_sale"

  resources :reasons
  root 'welcome#index'
  resources :products



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
