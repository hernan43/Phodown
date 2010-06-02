class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :name
      t.text :description
      t.boolean :is_hidden, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end