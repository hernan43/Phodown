class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  Paperclip::Railtie.insert
end
