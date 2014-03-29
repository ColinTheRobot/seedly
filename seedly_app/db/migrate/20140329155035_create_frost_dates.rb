class CreateFrostDates < ActiveRecord::Migration
  def change
    create_table :frost_dates do |t|
      t.integer :zipcode
      t.date    :prob_fifty_percent
      t.date    :pob_ten_percent
      t.date    :prob_nintey_percent
      t.timestamps
    end
  end
end

