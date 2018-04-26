Rails.application.routes.draw do
  devise_for :credentials, controllers: {
      sessions: 'credentials/sessions'
  }

  resources :categories
  resources :favorites
  resources :projects
  resources :users
  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
