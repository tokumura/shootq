Rails.application.routes.draw do

  resources :result_tnmtseconds do
    collection do
      get :init
    end
  end

  resources :tournament_seconds do
    collection do 
      get :init
      get :init_semifinal
      post :bet
      get :show_everyones
    end
  end

  resources :result_tnmtfirsts do
    collection do
      get :init
    end
  end

  resources :bet_winners do
    collection do
      get :init
      post :bet
      get :show_everyones
    end
  end

  resources :tournament_firsts do
    collection do 
      get :init
      post :bet
      get :show_everyones
    end
  end

  resources :result_seconds do
    collection do
      get :init
    end
  end

  root :to => 'welcome#index'
  resources :welcome, :only => ['index']
  get :portals, :to => 'portals#index', :as => :user_root

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :user_infos do
    collection do
      post :commit_voice
      get :init
    end
  end

  resources :portals

  resources :dashboard do
    collection do
      get :load_graph
    end
  end

  resources :news_feeds do
    collection do
      get :show_pickups
    end
  end

  resources :bet_firsts do
    collection do
      get :init
      get :show_everyones
      get :get_score
      get :show_ranking
      post :bet
    end
  end

  resources :bet_seconds do
    collection do
      get :init
      post :bet
      get :show_everyones
    end
  end

  resources :result_firsts do
    collection do
      get :init
    end
  end

  resources :countries do
    collection do
      get :init
    end
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
