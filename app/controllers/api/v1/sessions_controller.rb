class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: create_params[:email])
    if user && user.authenticate(create_params[:password])
      self.current_user = user
      render json: user, root: false, serializer:  Api::V1::SessionsSerializer, status: 201
    else
      return api_error(status: 401)
    end
  end

  private
    def create_params
      params.require(:user).permit(:email, :password)
    end
end
