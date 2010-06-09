module ApplicationHelper
  def avatar_for(user)
    # include MD5 gem, should be part of standard ruby install
    require 'digest/md5'

    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase

    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    # compile URL which can be used in <img src=""...
    image_src = "<img src=\"http://www.gravatar.com/avatar/#{hash}\"/>".html_safe
  end
end
