class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :person, foreign_key: true
      t.string :password
      t.string :email
      t.datetime :last_access
      t.integer :facebook_id
      t.integer :twitter_id

      t.timestamps
    end
  end
end
