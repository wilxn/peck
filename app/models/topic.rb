class Topic < ActiveRecord::Base

  belongs_to :user,:inverse_of => :topics
  belongs_to :node
  belongs_to :last_reply_user,:class_name => 'User'
  belongs_to :last_reply,:class_name => 'Reply'
  has_many :replies,:dependent => :destroy


end
