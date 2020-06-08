Rails.application.routes.draw do
  get 'subcategories/index'
  get 'subcategories/show'
  get 'categories/index'
  get 'categories/show'
  resources :businesses, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show]
  resources :subcategories, only: [:index, :show]
end
