class Challenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :rule

  has_many :entries
  
  scope :active, where(:is_hidden => false).order("name")
  scope :open,  proc { where("start < ?", DateTime.now).where("end > ?", DateTime.now).order("end ASC")}
  scope :voting,  proc { where("end < ?", DateTime.now).where("end > ?", DateTime.now - 7.days).order("end ASC")}
  scope :recent,  proc { where("end < ?", DateTime.now).where("end < ?", DateTime.now - 7.days).order("end ASC").limit(5)}

  def first_entry
    @first_entry ||= self.entries.order("id ASC").first
  end

  def voting_end_date
    self.end + 7.days
  end

  def is_over?
    self.is_closed? and not self.is_voting?
  end

  def is_voting?
    self.is_closed? and DateTime.now < self.voting_end_date
  end

  def is_closed?; not self.is_open?; end

  def is_open?
    begin
      not Challenge.open.find(self.id).nil?
    rescue
      false
    end
  end
end
