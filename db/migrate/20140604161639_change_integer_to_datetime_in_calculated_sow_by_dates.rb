class ChangeIntegerToDatetimeInCalculatedSowByDates < ActiveRecord::Migration
  def change
    remove_column :seeds, :calculated_sow_by_dates, :integer, array: true, default: []
    add_column :seeds, :calculated_sow_by_dates, :date, array: true, default: []
  end
end
