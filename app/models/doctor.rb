class Doctor < ActiveRecord::Base
  attr_accessible :name,:introduction,:skill,:username
  belongs_to :man
  has_many :judgement

	def Doctor.getDoctorbyName(name)
		doctor = find_by_name(name)
		doctor
	end

    searchable do
      text :introduction,:name
    end
end
