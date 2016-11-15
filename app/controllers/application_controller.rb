require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  respond_to :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper


  private

   def logged_in_user
      #this method tests to see if the user is logged in. if he is not store his location and send him to log in url
      unless logged_in?
        #for friendly forwarding is user is not logged in but tries to do something that they need to be logged in for. store location method is in the sessions helper
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
