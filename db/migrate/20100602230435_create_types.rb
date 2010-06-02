class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types do |t|
      t.string :name
      t.text :description
      t.boolean :is_hidden, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :types
  end
end
