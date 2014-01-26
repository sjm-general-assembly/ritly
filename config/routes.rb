Ritly::Application.routes.draw do

	# create a route for root link, sending to main/home page (index)
	root to: 'rlinks#index'

	# all standard Restful CRUD routes
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

