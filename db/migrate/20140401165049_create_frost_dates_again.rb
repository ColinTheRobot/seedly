class CreateFrostDatesAgain < ActiveRecord::Migration
  def change
    create_table :frost_dates do |t|
      t.integer    :prob_fifty_percent
      t.integer    :pob_ten_percent
      t.integer    :prob_nintey_percent
      t.integer     :user_id
      t.timestamps
    end
  end
end
