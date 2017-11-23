class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :file
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.string :cover

      t.timestamps
    end
  end
end
