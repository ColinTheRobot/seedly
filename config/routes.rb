# == Route Map (Updated 2014-06-03 14:50)
#
#                       Prefix Verb   URI Pattern                             Controller#Action
#                         root GET    /                                       welcome#index
#                  session_new GET    /session/new(.:format)                  session#new
#                      session POST   /session(.:format)                      session#create
#                       logout GET    /logout(.:format)                       session#destroy
#            frost_date_search GET    /frost_date/search(.:format)            frost_dates#search_frost_date
#         frost_date_searching GET    /frost_date/searching(.:format)         frost_dates#search
# frost_date_search_frost_date GET    /frost_date/search_frost_date(.:format) frost_dates#show
#                              POST   /frost_date/search_frost_date(.:format) frost_dates#create
#                        users GET    /users(.:format)                        users#index
#                              POST   /users(.:format)                        users#create
#                     new_user GET    /users/new(.:format)                    users#new
#                    edit_user GET    /users/:id/edit(.:format)               users#edit
#                         user GET    /users/:id(.:format)                    users#show
#                              PATCH  /users/:id(.:format)                    users#update
#                              PUT    /users/:id(.:format)                    users#update
#                              DELETE /users/:id(.:format)                    users#destroy
#                        seeds GET    /seeds(.:format)                        seeds#index
#                              POST   /seeds(.:format)                        seeds#create
#                     new_seed GET    /seeds/new(.:format)                    seeds#new
#                    edit_seed GET    /seeds/:id/edit(.:format)               seeds#edit
#                         seed GET    /seeds/:id(.:format)                    seeds#show
#                              PATCH  /seeds/:id(.:format)                    seeds#update
#                              PUT    /seeds/:id(.:format)                    seeds#update
#                              DELETE /seeds/:id(.:format)                    seeds#destroy
#                 sow_by_dates GET    /sow_by_dates(.:format)                 sow_by_dates#index
#                              POST   /sow_by_dates(.:format)                 sow_by_dates#create
#              new_sow_by_date GET    /sow_by_dates/new(.:format)             sow_by_dates#new
#             edit_sow_by_date GET    /sow_by_dates/:id/edit(.:format)        sow_by_dates#edit
#                  sow_by_date GET    /sow_by_dates/:id(.:format)             sow_by_dates#show
#                              PATCH  /sow_by_dates/:id(.:format)             sow_by_dates#update
#                              PUT    /sow_by_dates/:id(.:format)             sow_by_dates#update
#                              DELETE /sow_by_dates/:id(.:format)             sow_by_dates#destroy
#

SeedlyApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/session/new' => "session#new"
  post '/session' => "session#create"
  get '/logout' => "session#destroy"


  get 'frost_date/search' => "frost_dates#search_frost_date" #getting input from the user
  get 'frost_date/searching' => "frost_dates#search" #process of searching
  get 'frost_date/search_frost_date' => "frost_dates#show" #render in show
  post 'frost_date/search_frost_date' => "frost_dates#create" #if logged in save data to db
  put 'sow_by_date' => "sow_by_dates#update"
  get  'sow_by_dates' => "sow_by_dates#index"

  resources :users
  resources :seeds

  # resources :sow_by_dates
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
