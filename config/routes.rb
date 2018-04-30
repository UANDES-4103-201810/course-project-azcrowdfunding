Rails.application.routes.draw do
  resources :categories
  resources :favorites
  resources :projects
  devise_for :users
  resources :users, only: [:show]
  get 'my_projects', to: 'projects#show_my'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
end
