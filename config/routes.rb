Ritly::Application.routes.draw do

  get "users/new"
  get "users/show"
  get "users/create"
  get "sessions/new"
  get "sessions/destroy"
  get "new/show"
  get "new/create"
	# all standard Restful CRUD routes
	#      root GET     /                          rlinks#index
	#     rlinks GET    /rlinks(.:format)          rlinks#index
	#            POST   /rlinks(.:format)          rlinks#create
	#  new_rlink GET    /rlinks/new(.:format)      rlinks#new
	# edit_rlink GET    /rlinks/:id/edit(.:format) rlinks#edit
	#      rlink GET    /rlinks/:id(.:format)      rlinks#show
	#            PATCH  /rlinks/:id(.:format)      rlinks#update
	#            PUT    /rlinks/:id(.:format)      rlinks#update
	#            DELETE /rlinks/:id(.:format)      rlinks#destroy
	resources	:rlinks

	# create a route for root link, sending to main/home page (index)
	root to: 'rlinks#index'

	# custom application routes
	get '/rlinks/go/:link_token', to: "rlinks#route_link"

	# list routes for user login logout
	get '/signup' => 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'


end
