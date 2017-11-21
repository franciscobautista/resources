class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :facebook
      t.string :twitter
      t.string :google
      t.string :pinterest
      t.string :instagram
      t.string :linkedin
      t.string :web
      t.string :company
      t.string :city
      t.references :country, foreign_key: true
      t.timestamps
    end
  end
end
