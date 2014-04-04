# == Schema Information
#
# Table name: seeds
#
#  id                    :integer          not null, primary key
#  variety               :text
#  suggested_sowing_date :date
#  date_sown             :date
#  germ_soil_temp        :integer
#  seed_depth            :integer
#  germination_days      :integer
#  height_when_mature    :integer
#  thin_to_grow          :integer
#  optimum_soil_ph       :integer
#  optimum_soil_temp     :integer
#  days_to_harvest       :integer
#  planting_info         :text
#  user_id               :integer
#  bed_id                :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class Seed < ActiveRecord::Base
  belongs_to :user
  belongs_to :bed

  validates :variety, {presence: true}
  validates :user_id, {presence: true}

end
