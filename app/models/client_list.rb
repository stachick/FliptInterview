class ClientList < ActiveRecord::Base
	has_many :prospects

	validates :client, presence: true
end
