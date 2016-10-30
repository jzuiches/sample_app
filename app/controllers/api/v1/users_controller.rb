class Api::V1::UsersController < ApplicationController

  # before_action :generate_authentication_token

  def create
  end





  def show
    user = User.find(params[:id])

    render json: user, serializer: Api::V1::UserSerializer
  end

  def index
    users = User.all

    render(
      json: users, each_serializer: Api::V1::UserSerializer
      )

  end

  # def generate_authentication_token
  #   loop do
  #     self.authentication_token = SecureRandom.base64(64)
  #     break unless User.find_by(authentication_token: authentication_token)
  #   end
  # end

end
