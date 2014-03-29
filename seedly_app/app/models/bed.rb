class Bed < ActiveRecord::Base
  has_many :seeds
  belongs_to :user
end
