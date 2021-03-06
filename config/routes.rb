Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get  "auth/:provider", to: "sessions#create", as: 'login'
  get "/auth/:provider/callback", to: "sessions#create"

  # get "user/:id/profile", to: "users#index", as: "profile"
  # get "user/:id/profile/new_pet", to: "pets#new", as: "new_pet"
  # post "user/:id/profile/create", to: "pets#create", as: "create_pet"

  resources :users, only: [:show, :edit, :update]
  resources :pets, only: [:new, :create]
  resources :inventories, only: [:new, :create, :edit, :update]

  get "users/:id/remove_pet", to: "users#remove_pet", as: 'remove_pet'
  post "regenerate", to: "pets#regenerate_token", as: "regenerate"
  get "/schedules", to: "schedule#index", as: "schedules"


  get "logout", to: "sessions#destroy", as: "logout"

  # route to update db to save request as "feed"
  post "/feed_request", to: "pi#feed_request", as: "feed_request"
  get "/new_schedule", to: "pi#new_schedule", as: "schedule"
  patch "/set_timer", to: "pi#set_timer", as: "timer"
  put "/cancel_feeding", to: "pi#cancel_feeding", as: "cancel"
  # put "/reset_request", to: "pi#reset_request", as: "reset_request"

  # API endpoints. One to check for request, the second to recieve confirmation

  get "/api/v1/requests/new", to: "api/v1/requests#run_pi", as: "pi"
  put "/api/v1/requests/confirmation", to: "api/v1/requests#confirmation", as: "pi_confirmation"

  get "/check_db", to: "home#check_db", as: "check_db"

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
