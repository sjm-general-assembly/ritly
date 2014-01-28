class RlinksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update]

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
		@current_link = Rlink.find(params[:id])
	end

	# GETs a form to edit a link
	def edit
		@rlink = Rlink.find(params[:id])
	end

	# PATCH saves the updated attributes
	def update
		updated_info = params.require(:rlink).permit(:link, :random_string)
		rlink = Rlink.find(params[:id])
		rlink.update_attributes(updated_info)
		redirect_to rlink
	end

	# DELETE destroy the selected link
	def destroy
		rlink = Rlink.find(params[:id])
		rlink.destroy

		redirect_to action: :index
	end

	# GET - user entered URL with go/token
	def route_link
		new_url = Rlink.url_lookup_by_token(params[:link_token])
		new_url == nil ? (render :token_not_found) : (redirect_to new_url)
	end

end

