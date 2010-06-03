class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  scope :active, where(:is_hidden => false).order("name")
end
