Rails.application.routes.draw do
  resources :categories
  resources :kinds
  resources :bookmarks
  get "get_categories", to: "categories#get_categories"
  root to: "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
