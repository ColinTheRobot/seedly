class ChangeColumnDatatypesInFrostDates < ActiveRecord::Migration
  def change
    change_column :frost_dates, :prob_fifty_percent, :text
    change_column :frost_dates, :pob_ten_percent, :text
    change_column :frost_dates, :prob_nintey_percent, :text
  end
end
