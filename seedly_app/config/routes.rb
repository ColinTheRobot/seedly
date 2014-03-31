# == Route Map (Updated 2014-03-31 09:56)
#
#       Prefix Verb   URI Pattern               Controller#Action
#         root GET    /                         welcome#index
#  session_new GET    /session/new(.:format)    session#new
#      session POST   /session(.:format)        session#create
#       logout GET    /logout(.:format)         session#destroy
# frost_dates_search GET    /dates/search(.:format)   frost_dates#search
#        users GET    /users(.:format)          users#index
#              POST   /users(.:format)          users#create
#     new_user GET    /users/new(.:format)      users#new
#    edit_user GET    /users/:id/edit(.:format) users#edit
#         user GET    /users/:id(.:format)      users#show
#              PATCH  /users/:id(.:format)      users#update
#              PUT    /users/:id(.:format)      users#update
#              DELETE /users/:id(.:format)      users#destroy
#

SeedlyApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/session/new' => "session#new"
  post '/session' => "session#create"
  get '/logout' => "session#destroy"

  get 'frost_date/search' => "frost_dates#search_frost_date"
  get 'frost_date/searching' => "frost_dates#search"
  get 'frost_date/search_frost_date' => "frost_dates#show"

  # get 'frost_dates/search' => "frost_dates#show"

  resources :users
  # resources :frost_dates


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
