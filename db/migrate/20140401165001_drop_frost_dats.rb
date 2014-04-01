class DropFrostDats < ActiveRecord::Migration
  def change
    drop_table :frost_dates
  end
end
