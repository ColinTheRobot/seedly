# == Schema Information
#
# Table name: beds
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Bed < ActiveRecord::Base
  has_many :seeds
  belongs_to :user
end
