# == Schema Information
#
# Table name: rlinks
#
#  id            :integer          not null, primary key
#  link          :string(255)
#  random_string :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Rlink < ActiveRecord::Base
	validates :random_string, uniqueness: true

	def self.url_lookup_by_token(link_token)

		# search for the record with provided link token (aka random_string)
		lookup_rec = self.find_by(random_string: link_token)

		# TODO - consider adding index on random_string, improve search performance

		if lookup_rec == nil		# no record was found, return nil
			lookup_url = nil
		else
			lookup_url = lookup_rec.link
		
			# check url, prepend scheme if missing
			lookup_url.prepend('http://') if URI(lookup_url).scheme == nil
		end

		return lookup_url
	end

end
