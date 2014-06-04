class AddCalculatedSowByDatesToSeeds < ActiveRecord::Migration
  def change
    add_column :seeds, :calculated_sow_by_dates, :integer, array: true, default: []
  end
end
