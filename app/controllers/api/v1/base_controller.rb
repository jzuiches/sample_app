class Api::V1::BaseController < ApplicationController


  before_action :destroy_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def authenticate_user!
    token, options =
    ActionController::HttpAuthentication::Token.token_and_options(request)

    user_email = options.blank?? nil : options[:email]
    user = user_email && User.find_by(email: user_email)

    if user && ActiveSupport::SecurityUtils.secure_compare(user.authenticate_token, token)
      @current_user = user
    else
      return unauthenticated!
    end
  end



  def not_found
    return api_error(status: 404, errors: 'Not found')
  end

  def destroy_session
    request.session_options[:skip] = true
  end

end
