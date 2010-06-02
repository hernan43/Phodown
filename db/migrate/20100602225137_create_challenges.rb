class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :type_id
      t.integer :rules_id
      t.datetime :start
      t.datetime :end
      t.boolean :is_hidden, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
