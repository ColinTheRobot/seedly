class ChangeDataTypesInSeeds < ActiveRecord::Migration
  def change
    change_column :seeds, :suggested_sowing_date, :text
    change_column :seeds, :date_sown, :text
    change_column :seeds, :germ_soil_temp, :text
    change_column :seeds, :seed_depth, :text
    change_column :seeds, :germination_days, :text
    change_column :seeds, :height_when_mature, :text
    change_column :seeds, :thin_to_grow, :text
    change_column :seeds, :optimum_soil_ph, :text
    change_column :seeds, :optimum_soil_temp, :text
    change_column :seeds, :days_to_harvest, :text
    change_column :seeds, :planting_info, :text
  end
end
