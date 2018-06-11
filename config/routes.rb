Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  resources :favorites
  resources :projects
  resources :promises
  resources :finances
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [:show]
  get 'new_promise', to: 'promises#new'
  get 'my_projects', to: 'projects#show_my'
  get 'show_all', to: 'users#show_all'
  get 'show_my_fav', to: 'favorites#show_my_fav'
  get 'show_my_waiting', to: 'projects#show_my_waiting'
  get 'show_my_funded', to: 'projects#show_my_funded'
  get 'show_outstanding', to: 'projects#show_outstanding'
  get 'make_outstanding', to: 'projects#make_outstanding'
  get 'download_image_p', to: 'projects#download_file'
  get 'download_image_u', to: 'users#download_file'
  get 'contribution/create', to: 'contributions#create'
  get 'finance/create', to: 'finances#create'

  resources :projects do
    put :favorite, on: :member
  end
  get 'show_by_cat', to: 'categories#show_by_cat'
  get 'show_user_projects', to: 'projects#show_user_projects'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :users, :controller => "users"
  resources :promises, :controller => "promises"

end
