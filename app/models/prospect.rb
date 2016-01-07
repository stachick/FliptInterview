class Prospect < ActiveRecord::Base
  belongs_to :client_list

  validates :name, presence: true
end
