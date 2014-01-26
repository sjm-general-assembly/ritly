class Rlink < ActiveRecord::Base
	validates :random_string, uniqueness: true
end
