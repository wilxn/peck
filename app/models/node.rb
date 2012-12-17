class Node < ActiveRecord::Base
 
  has_many :topics
  belongs_to :section
  def self.findbyId(id)
  	node = find_by_id(id)
  	node
  end
end
