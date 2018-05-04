Rails.application.routes.draw do
  resources :categories
  resources :favorites
  resources :projects
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [:show]
  get 'my_projects', to: 'projects#show_my'
  get 'show_all', to: 'users#show_all'
  get 'show_my_fav', to: 'favorites#show_my_fav'
  get 'show_my_waiting', to: 'projects#show_my_waiting'
  get 'show_my_funded', to: 'projects#show_my_funded'
  get 'show_outstanding', to: 'projects#show_outstanding'
  get 'make_outstanding', to: 'projects#make_outstanding'
  resources :projects do
    put :favorite, on: :member
  end
  get 'show_by_cat', to: 'categories#show_by_cat'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :users, :controller => "users"

end
