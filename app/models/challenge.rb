class Challenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :rule

  has_many :entries
  
  scope :active, where(:is_hidden => false).order("name")
  scope :open,  proc { where("start < ?", DateTime.now).where("end > ?", DateTime.now).order("end ASC")}

  def is_open?
    not Challenge.open.find(self.id).nil?
  end
end
