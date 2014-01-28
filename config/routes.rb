Ritly::Application.routes.draw do

	# create a route for root link, sending to main/home page (index)
	root to: 'rlinks#index'

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

	# custom application routes
	get '/rlinks/go/:link_token', to: "rlinks#route_link"

end
