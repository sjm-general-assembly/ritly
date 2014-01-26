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

end

# just wanted to share this code in case anyone wants to use it. 
# There's a URI method you can call on a link <URI(link)> that will
# let you check the different parts of it, so could check to see if
# it has 'http' in the beginning by calling <link.scheme>. Before my
# app would only work if you gave it a link that already contained
# 'http', but this lets you test to see if it's not there and you can
# add it in for the user.

# def route
#     ritlycode = params[:ritlyurl]
#     url = Url.find_by string: ritlycode
#     link = url.link

#     test = URI(link)
#     link = "http://" + link if test.scheme == nil

#     redirect_to link
#   end

