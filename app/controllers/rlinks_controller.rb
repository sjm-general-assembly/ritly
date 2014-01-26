class RlinksController < ApplicationController

		# home/index page GET, shows a list of current links
		def index
			@rlinks = Rlink.all
		end

		# GETs a form to create a new link
		def new
			@rlink = Rlink.new
		end

		# POSTs the results from new, creating a new link
		def create
			new_rlink = params.require(:rlink).permit(:link, :random_string)
			rlink = Rlink.create(new_rlink)
    	redirect_to rlink
		end

		# GETs a form (disabled) to display a given link
		def show
			id = params[:id]
			@current_link = Rlink.find(id)
			@on_show_page = true
			@on_show_item_id = id
		end

		# GETs a form to edit a link
		def edit
			id = params[:id]
			@rlink = Rlink.find(id)
		end

		# PATCH saves the updated attributes
		def update
			id = params[:id]
			updated_info = params.require(:rlink).permit(:link, :random_string)
			rlink = Rlink.find(id)
			rlink.update_attributes(updated_info)
			redirect_to rlink
		end

end