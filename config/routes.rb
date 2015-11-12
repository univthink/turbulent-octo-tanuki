Rails.application.routes.draw do
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :users, only: [:new, :create]

  resources :user_sessions, only: [:create, :destroy]

  get '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in


  resources :posts

  get 'blog' => 'welcome#all', as: "blog"

  get 'about' => 'welcome#about', as: "about"

  get 'contact' => 'welcome#contact', as: "contact"

  get 'error' => 'welcome#error', as: "error"

  get 'posts/new/(:id)/delete' => 'posts#destroy', as: "delete"

  get 'posts/(:id)' => 'posts#show'
end
