class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  PROFILE_TITLE = [
    'Senior Ruby on rails Devloper',
    'Full Stack Ruby on Rails Developer',
    'Senior Full Stack Ruby on Rails Developer',
    'Junior FullStack Ruby on Rails Developer',
    'Senior java Devloper',
    'Senior Front End Developer'
  ].freeze

  def name 
    "#{first_name} #{last_name}".strip
  end

  def self.ransackable_attributes(auth_object = nil)
    ['country', 'city']
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def address 
    "#{city}, #{state}, #{country}, #{pincode}"
  end
end