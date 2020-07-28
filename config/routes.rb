Rails.application.routes.draw do
	root 'categories#index'
  get 'subcategories/index'
  get 'subcategories/show'
  get 'categories/index'
  get 'categories/show'
  resources :businesses, only: [:show, :new, :edit, :create, :update]
  resources :categories, only: [:index, :show]
  resources :subcategories, only: [:index, :show]
  resources :socials, only: [:destroy]
end
