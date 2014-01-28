Ritly::Application.routes.draw do

	# all standard Restful CRUD routes (listed example for rlinks, also includes users, sessions)
	#      root GET     /                          rlinks#index
	#     rlinks GET    /rlinks(.:format)          rlinks#index
	#            POST   /rlinks(.:format)          rlinks#create
	#  new_rlink GET    /rlinks/new(.:format)      rlinks#new
	# edit_rlink GET    /rlinks/:id/edit(.:format) rlinks#edit
	#      rlink GET    /rlinks/:id(.:format)      rlinks#show
	#            PATCH  /rlinks/:id(.:format)      rlinks#update
	#            PUT    /rlinks/:id(.:format)      rlinks#update
	#            DELETE /rlinks/:id(.:format)      rlinks#destroy
	resources	:rlinks, :users, :sessions

	# create a route for root link, sending to main/home page (index)
	root to: 'rlinks#index'

	# custom application routes
	get '/rlinks/go/:link_token', to: "rlinks#route_link"

	# list routes for user login logout
	get '/signup' => 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'


end
