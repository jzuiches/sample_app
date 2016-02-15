class TrainingDivisionsController < ApplicationController

  def index
    @training_divisions = TrainingDivision.all
  end

  def show
    @training = current_user.trainings.build if logged_in?
    @training_division = TrainingDivision.find(params[:id])
  end


end
