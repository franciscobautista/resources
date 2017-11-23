class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.references :resource, foreign_key: true
      t.integer :num

      t.timestamps
    end
  end
end
