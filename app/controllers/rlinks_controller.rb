class RlinksController < ApplicationController

		def index
			@rlinks = Rlink.all
		end

end