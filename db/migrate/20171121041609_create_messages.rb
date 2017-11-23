class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :users_conversation, foreign_key: true
      t.text :message
      t.boolean :status
      t.timestamps
    end
  end
end
