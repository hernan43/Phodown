class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  Paperclip::Railtie.insert
  
  protected
 
  def is_admin?
    if not current_user.is_admin == 1
      redirect_to :root
    end
  end
end
