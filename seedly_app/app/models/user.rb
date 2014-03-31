class User < ActiveRecord::Base
  has_many :seeds, through: :beds
  has_many :beds
  has_one :frost_date
  has_secure_password

  validates(:name, { :presence => true})
  validates(:name, { :presence => {case_sensitive: false}})

end
