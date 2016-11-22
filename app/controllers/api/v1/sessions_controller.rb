class Api::V1::SessionsController < ApplicationController


  def create
    user = User.find_by(email: create_params[:email])
    if user && user.authenticate(create_params[:password])
    render json: payload(user)
    else
      render text: "Email and password combination are invalid", status: 422
    end
  end

  def destroy
    render plain: "You have been logged out", status: 200
  end

  private
    def create_params
      params.require(:session).permit(:email, :password)
    end

    def payload(user)
      return nil unless user && user.id
      {
        auth_token: JsonWebToken.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
      }
    end


end
