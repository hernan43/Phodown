class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.string :title
      t.text :description
      t.string :location
      t.boolean :is_disqualified, :default => false
      t.boolean :is_hidden, :default => false
      t.float :average_rating
      t.string :shutter_speed
      t.string :aperture
      t.string :focal_length
      t.string :iso
      t.boolean :flash, :default => false
      t.text :exif
      t.string :camera_model
      t.string :camera_make

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
