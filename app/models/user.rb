class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:login,:name,:location,:tagline,:company,:bio

  has_many :topics,:dependent => :destroy
  has_many :notes
  has_many :replies,:dependent => :destroy
  validates_presence_of :email

end
