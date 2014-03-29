class Seed < ActiveRecord::Base
  belongs_to :user, through :beds
  belongs_to :beds
end
