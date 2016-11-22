class TrainingDivisionsController < ApplicationController
# before_action :logged_in_user
  def index
    @training_divisions = TrainingDivision.all
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @training_divisions }
    # end
  end

  def show
    @training = current_user.trainings.build
    # if logged_in?

    @training_division = TrainingDivision.find(params[:id])

    @training_codes = TrainingCode.all

    @training.trainings_training_codes.build
    if params[:id] == "1"
      @codes = @training_codes[0..6]
    elsif params[:id] == "2"
      @codes = @training_codes[7..12]
    elsif params[:id] == "3"
      @codes = @training_codes[13..19]
    elsif params[:id]  == "5"
      @codes = @training_codes[20..24]
    elsif params[:id]  == "6"
      @codes = @training_codes[25..30]
    elsif params[:id] == '7'
      @codes = @training_codes[31..32]
    else params[:id] == "8"
      @codes = @training_codes[33..37]
    end
    @routes = @training_codes[38..69]
  end
end
