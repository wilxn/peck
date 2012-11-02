class Man < ActiveRecord::Base

    

	validates :name,:presence => true, :uniqueness => true

	validates :password,:confirmation => true
	attr_accessor :password_confirmation
	attr_reader :password
	validate :password_must_be_present

    has_one :doctor, :dependent => :destroy
    has_many :judgements

    def Man.getManbyId(id)
      man = find_by_id(id)
      man
    end
    def Man.getManbyName(name)
      man = find_by_name(name)
      man
    end
    def Man.getDoctor_id(id)
      man = find_by_id(id)
      man.doctor_id
    end

    def Man.test_idcard_by_realname(idcard,realname)
      isTrue = false
      id_realname = Hash["wangxin" => "610125199209110840" ,"huangzhiyong" => "362524199210014017","yushuangxin" => "220122198602201370","sunxingchen"=>"123456789000000000"]
      expected_name = id_realname.index(idcard)
      if expected_name != nil
        if realname == expected_name
          isTrue = true
        else
          isTrue = false
        end
    end
      isTrue
    end


	def Man.authenticate(name,password)
        if name != nil
		if man = find_by_name(name)
			if man.hashed_password == encrypt_password(password,man.salt)
				man
			end
		end
        end
	end

	def Man.checkIsDoctor(name)
		man = find_by_name(name)
		man.isDoctor
	end
			

	def Man.encrypt_password(password,salt)
		Digest::SHA2.hexdigest(password+"wibble"+salt)
	end

	def password=(password)
		@password= password

		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password,salt)
		end
	end

	private
	def password_must_be_present
		errors.add(:password,"Missing password") unless hashed_password.present?
	end

	def generate_salt
		self.salt=self.object_id.to_s + rand.to_s
	end
end
