class Doctor < ActiveRecord::Base
  belongs_to :man
  has_many :judgement

	def Doctor.getDoctorbyName(name)
		doctor = find_by_name(name)
		doctor
	end
end
