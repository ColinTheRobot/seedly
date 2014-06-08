# == Schema Information
#
# Table name: seeds
#
#  id                    :integer          not null, primary key
#  variety               :text
#  suggested_sowing_date :text
#  date_sown             :text
#  germ_soil_temp        :text
#  seed_depth            :text
#  germination_days      :text
#  height_when_mature    :text
#  thin_to_grow          :text
#  optimum_soil_ph       :text
#  optimum_soil_temp     :text
#  days_to_harvest       :text
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
  validates :suggested_sowing_date, {presence: true}

end
