class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  has_attached_file :photo, :styles => { :medium => ["800x800>", :jpg], :thumb => ["128x128>", :jpg] }

  scope :active, where(:is_hidden => false).order("name")

  before_create :set_average_rating

  # override Paperclip's setter method so I can access the uploaded file
  # http://pastie.org/310107
  def photo=(file)
    set_exif_data(file)
    attachment_for(:photo).assign(file)
  end


  protected
  
  def set_exif_data(file)
    self.exif = `identify -format "%[exif:*]" #{file.path}`
  end

  def set_average_rating(rating=0.0)
    self.average_rating = rating
  end
end
