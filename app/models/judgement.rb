class Judgement < ActiveRecord::Base
  belongs_to :man
  belongs_to :doctor
end
