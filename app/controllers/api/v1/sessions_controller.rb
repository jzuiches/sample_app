class Api::V1::SessionsController < ApplicationController


  def create
    user = User.find_by(email: create_params[:email])
    if user && user.authenticate(create_params[:password])

      render json: user, root: false, serializer:  Api::V1::SessionsSerializer, status: 201
    else
      render plain: "Email and password combination are invalid", status: 422
    end
  end

  private
    def create_params
      params.require(:session).permit(:email, :password)
    end
end
