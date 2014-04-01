# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  frostdate_id    :integer
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :seeds, through: :beds
  has_many :beds
  has_one :frost_date
  has_secure_password

  validates(:name, { :presence => true})
  validates(:name, { :presence => {case_sensitive: false}})

end
