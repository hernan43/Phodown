class Type < ActiveRecord::Base
  scope :active, where(:is_hidden => false).order("name")
end
