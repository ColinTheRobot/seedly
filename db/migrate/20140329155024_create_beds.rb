class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.text    :name
      t.text    :description
      t.integer :user_id
      t.timestamps
    end
  end
end
