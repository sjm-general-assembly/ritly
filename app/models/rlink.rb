class Rlink < ActiveRecord::Base
	validates :random_string, uniqueness: true

	def self.url_lookup_by_token(link_token)

		# search for the record with provided link token (aka random_string)
		lookup_url = self.find_by(random_string: link_token).link

		# TODO - consider adding index on random_string, improve search performance

		# check url, prepend scheme if missing
		lookup_url.prepend('http://') if URI(lookup_url).scheme == nil

		return lookup_url
	end

end
