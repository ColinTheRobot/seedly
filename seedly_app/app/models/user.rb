class User < ActiveRecord::Base
  has_many :seeds, through: beds:
  has_many :beds
  include BCrypt
  def password
    @password ||= Password.new(password_hash) #is this the digest
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_has = @password
  end
  has_secure_password

  validates(:name, { :presence => true})
  validates(:name, { :presence => {case_sensitive: false}})
  validates(:balance, { :numericality => { :greater_that_or_equal_to => 0}})
end
