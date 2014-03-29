class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text    :name
      t.text    :email
      t.integer :frostdate_id
      t.string  :password_digest
      t.timestamps
    end
  end
end
