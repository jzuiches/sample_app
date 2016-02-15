class StaticPagesController < ApplicationController
  def home
    @training = current_user.trainings.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end

end
