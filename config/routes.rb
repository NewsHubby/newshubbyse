Rails.application.routes.draw do

  get '/om' => 'press_rooms#about'
  get '/anvandarvillkor' => 'press_rooms#terms_and_conditions'
  get '/tack' => 'distributions#distribution_complete'
  #put '/charges/cancel_subscription' => 'charges#cancel_subscription'

  resources :questions, :path => 'faq'

  resources :categories do
    resources :press_release_types
  end

  devise_for :press_rooms, :controllers => { :registrations => "registrations" }

  resources :press_rooms, :path => '/' do
    get :autocomplete_press_release_title, :on => :collection
    resources :press_releases, path: 'pressreleases' do
      resources :distributions#, shallow: true
    end
    resources :people
    resources :fundings
  end

  #resources :charges
  #resources :charges do
  #  collection do
  #    post :cancel_subscription
  #  end
  #end
  resources :charges do
    collection do
      post 'unsubscribe', :action => :cancel_subscription
      post 'resume_subscription', :action => :resume_subscription
      post 'upgrade_subscription', :action => :upgrade_subscription
      post 'downgrade_subscription', :action => :downgrade_subscription
    end
  end

  #resources :charges do
  #  put :cancel_subscription, :on => :collection
  #end

  root "press_rooms#index"

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
