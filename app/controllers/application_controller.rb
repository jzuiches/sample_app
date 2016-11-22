require "application_responder"

class ApplicationController < ActionController::Base

  attr_reader :current_user
  self.responder = ApplicationResponder
  respond_to :html
  respond_to :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper




  protected
  def authenticate_request!
    puts "doing jwt stuff"
    unless user_id_in_token?
      # if there isn't a user id in the jwt this method user_id_in_token also wants to see that there is a
      #   http_token and a auth_token which is an http token that has been decoded
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private
  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

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
