Rails.application.routes.draw do
  resources :profiles

  post 'galaxies/find_friends', to: 'galaxies#find_friends', as: 'find_friends'
  post 'galaxies/add_friend', to: 'galaxies#add_friend', as: 'add_friend'
  post 'galaxies/get_friends', to: 'galaxies#get_friends', as: 'get_friends'

  get 'user/{:id}', to: 'galaxies#get_user', as: 'get_user'
  # post 'someajax' => 'galaxies#find_friends'
  resources :galaxies do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
    collection do
      # post 'find_friends/:id', to: 'galaxies#find_friends', as: 'find_friends'
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
