class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.text    :variety
      t.date    :suggested_sowing_date #frost date calculation
      t.date    :date_sown
      t.integer :germ_soil_temp        # farenheit
      t.integer :seed_depth            # inches
      t.integer :germination_days
      t.integer :height_when_mature    # inches
      t.integer :thin_to_grow          #inches
      t.integer :optimum_soil_ph
      t.integer :optimum_soil_temp     #farenheit
      t.integer :days_to_harvest
      t.text    :planting_info
      t.integer :user_id
      t.integer :bed_id
      t.timestamps
    end
  end
end
