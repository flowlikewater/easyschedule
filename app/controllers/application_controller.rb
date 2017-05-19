class ApplicationController < ActionController::Base

# prevent CSFR attacks by raising an exception. For APIs use :null_session instead of :exception

  protect_from_forgery with: :null_session
end
