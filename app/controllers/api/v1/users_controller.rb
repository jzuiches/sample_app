class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: [:index, :show, :update, :destroy]


  def create
    @user = User.new(user_params)
    admin_add
    # if ENV['PATROLLER_ARRAY'].split.include?(@user.email)
    puts "in user create #{user_params}"
      if @user.save
        puts "user has saved"
        @user.send_activation_email
        render plain: "Please check your email to activate your account"

      #when the user saves the log_in method is called
      # log_in @user
      # redirect_to trainings_path
      else
        render plain: "account creation unsuccessful"
      end
    # else
    #   flash[:danger] = "Must be a Squaw Valley patroller"
    #   render 'new'
    # end
  end





  def show

    user = User.find(params[:id])
    puts "authenticating..."

    if user
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

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def admin_add
      if ENV['ADMIN_ARRAY'].split.include?(@user.email)
        @user.admin = true
      end
    end

end
