Branch::Application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: { registrations: "registrations" }

  mount Matcher::Engine, at: 'matcher'

  resources :discussion_topics do
    resources :votes, only: [:create]
  end

  resources :profiles

  resources :comments do
    resources :votes, only: [:create]
  end

  resources :amendments do
    resources :votes, only: [:create]
  end

  resources :proposals, except: [:destroy] do
    resources :votes, only: [:create]
  end

  resources :friendships, only: [:index, :create, :destroy]

  resources :feed_items, only: [:index ]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'info/:page' => 'pages#show', as: :pages

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
