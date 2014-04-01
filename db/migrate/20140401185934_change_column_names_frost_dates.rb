class ChangeColumnNamesFrostDates < ActiveRecord::Migration
  change_table :frost_dates do |t|
    t.rename :pob_ten_percent, :prob_ten_percent
    t.rename :prob_nintey_percent, :prob_ninety_percent
  end
end
