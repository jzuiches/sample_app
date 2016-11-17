class Api::V1::SessionsController < ApplicationController


  def create
    user = User.find_by(email: create_params[:email])
    if user && user.authenticate(create_params[:password])
    current_user = user
render(
json: Api::V1::SessionSerializer.new(user, root: false).to_json,
status: 201
)
else
 render text: "Email and password combination are invalid", status: 422
end
end

  private
    def create_params
      params.require(:session).permit(:email, :password)
    end
end
