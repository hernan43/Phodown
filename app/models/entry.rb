class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  has_attached_file :photo, :styles => { :original => ["800x800>", :jpg], :thumb => ["128x128>", :jpg] }

  scope :active, where(:is_hidden => false).order("name")

  before_create :set_average_rating

  # override Paperclip's setter method so I can access the uploaded file
  # http://pastie.org/310107
  def photo=(file)
    set_exif_data(file)
    attachment_for(:photo).assign(file)
  end

  def rating_for(user)
    Rating.where(:entry_id => self.id).where(:user_id => user.id).first
  end

  protected
  
  def string_fraction_to_float(fraction)
    return nil if fraction.nil?
    begin
      /(\d+)\/(\d+)/.match(fraction)
      $1.to_f / $2.to_f
    rescue
      nil
    end
  end

  def split_exif(exif_data)
      exif_entries = exif_data.split("\n")
      exif_entries = exif_entries.collect do |entry|
        begin 
          entry.split(":")[1].strip.split("=")
        rescue
        end
      end

      # for the life of me I can't find a better way of doing this
      exif_hash = {}
      exif_entries.each do |entry|
        begin
          exif_hash[entry[0].to_sym] = entry[1]
        rescue
        end
      end
      return exif_hash
  end

  def set_exif_data(file)
    self.exif = `identify -format "%[exif:*]" #{file.path}`
    exif = split_exif(self.exif)
    self.shutter_speed = exif[:ExposureTime] if not exif[:ExposureTime].nil?
    self.camera_model = exif[:Model] if not exif[:Model].nil?
    self.camera_make = exif[:Make] if not exif[:Make].nil?
    self.iso = exif[:ISOSpeedRatings] if not exif[:ISOSpeedRatings].nil?
    self.flash = exif[:Flash] if not exif[:Flash].nil?
    self.aperture = string_fraction_to_float(exif[:ApertureValue])
  end

  def set_average_rating(rating=0.0)
    self.average_rating = rating
  end
end
