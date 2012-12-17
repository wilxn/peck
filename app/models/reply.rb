class Reply < ActiveRecord::Base
  belongs_to :user,:inverse_of => :replies
  belongs_to :topic,:inverse_of => :replies
end
