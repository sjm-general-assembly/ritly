class RlinksController < ApplicationController

		# home/index page GET, shows a list of current links
		def index
			@rlinks = Rlink.all
		end

		# GETs a form to create a new link
		def new
		end

		# POSTs the results from new, creating a new link
		def create
			new_rlink = params.require(:rlink).permit(:link, :random_string)
			Rlink.create(new_rlink)
	    redirect_to action: :index
		end

		# GETSs a form (disabled) to display a given link
		def show
			id = params[:id]
			@current_link = Rlink.find(id)

		end

end