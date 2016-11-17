class Api::V1::UsersController < ApplicationController

  # before_action :generate_authentication_token

  def create
  end





  def show
    puts request.headers['Set-Cookie']
    user = User.find(params[:id])
    puts "authenticating..."
    if request.headers['Set-Cookie'] == nil
      return api_error(status: 404)
    elsif user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, request.headers['Set-Cookie'])
      @current_user = user
      render json: @current_user, serializer: Api::V1::UserSerializer
    else
      render status: 401
    end


  end

  def index
    users = User.all
    render(
      json: users, each_serializer: Api::V1::UserSerializer
      )

  end

  private
    def api_error(status)
      render file: "public/500.html"
    end


end
