class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :user
      t.boolean :full
      t.integer :uid

      t.timestamps
    end
  end
end
