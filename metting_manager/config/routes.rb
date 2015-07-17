Rails.application.routes.draw do
  resources :groups
  resources :groups
  get 'groups/index'

  get 'users/search'
  post 'users/search'
  get 'users/index'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: 'users/registrations',
                                }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  resources :users do            #tao moi quan he trong chung
    resources :groups do  
      get 'memberlists/add'
      post 'memberlists/add'       #1 user co nhieu group
    resources :profiles
    resources :groups do         #1 user co nhieu group
      resources :memberlists do  #1 group co nhieu memberlists
        resources :profiles do
        end
      end
    end
  end
  resources :time_orders do
  end
  resources :welcome do
  end
  resources :attended_groups do
  end

  resources :groups do
    get 'profile'

  end
  resources :profiles do
    get 'show'
  end
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
