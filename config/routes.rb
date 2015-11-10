Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :posts

  get 'blog' => 'welcome#all', as: "blog"

  get 'about' => 'welcome#about', as: "about"

  get 'contact' => 'welcome#contact', as: "contact"

  get 'error' => 'welcome#error', as: "error"

  get 'posts/new/(:id)/delete' => 'posts#destroy', as: "delete"

end
