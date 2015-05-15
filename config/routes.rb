Rails.application.routes.draw do
 

  get 'comments/show'

  get 'comments/create'

  get 'comments/destroy'

  resources :users
  resources :users
  root 'projects#index'


  resources :user_sessions, only: [:new,:create, :destroy]
  resources :users, only: [:new,:create]
  resources :pledges, only: [:new,:create, :show, :index]

  resources :projects, only: [:index, :new, :create, :show, :edit, :destroy] 
 
  resources :projects do
    resources :rewards, only: [:new, :create, :edit, :show, :destroy] 
    resources :comments, only: [:show, :create, :destroy]
  end 


  


get "logout" => "user_sessions#destroy", :as => "logout"
get "login" => "user_sessions#new", :as => "login"
get "signup" => "users#new", :as => "signup"

  namespace :admin do
    resources :users
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
