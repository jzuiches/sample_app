class UsersController < ApplicationController
  #logged in users can get to these actions
   before_action :logged_in_user, only: [:edit, :update, :show, :destroy]
   #this constrains that the user can only see their info
   before_action :correct_user,   only: [:edit, :update, :show]
   before_action :admin_user, only: [:index, :destroy]
  def show
    @user = User.find(params[:id])
  end




  def new
    @user = User.new
  end
#the create method gives user_params to a new user object
  def create
    @user = User.new(user_params)
    admin_add
    if @user.save
      #when the user saves the log_in method is called
      log_in @user
      redirect_to trainings_path
    else
      render 'new'
    end
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def admin_add
    if ENV['ADMIN_ARRAY'].split.include?(@user.email)
      @user.admin = true
    end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Patroller was deleted from database"
    redirect_to users_url
  end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end


#private methods cannot be called by an instance of a class. they can be called by other methods in the class. it sends the messege to self
  private

  #normal params but has special require and permit methods
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
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

    def correct_user

      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      #current user method which authenticate a logged in user asks the user object if the admin attribut is true or false. if it is false then it will redirect to root.
      redirect_to(root_url) unless current_user.admin?
    end

end
