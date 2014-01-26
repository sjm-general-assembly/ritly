class CreateRlinks < ActiveRecord::Migration
  def change
    create_table :rlinks do |t|
      t.string :link
      t.string :random_string

      t.timestamps
    end
    add_index :rlinks, :link, unique: true
    add_index :rlinks, :random_string, unique: true
  end
end
