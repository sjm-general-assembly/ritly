class Rlink < ActiveRecord::Base
	validates :random_string, uniqueness: true

	def self.url_lookup_by_token(link_token)
		puts("****** link token: #{link_token}")

		# new_url = Rlink.lookup_token(link_token)
		lookup_url = 'www.google.com'

		# check url, prepend scheme if missing
		lookup_url.prepend('http://') if URI(lookup_url).scheme == nil

		return lookup_url
	end

end
