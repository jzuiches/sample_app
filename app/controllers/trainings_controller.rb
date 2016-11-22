class TrainingsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:destroy]

  def new
    @training = current_user.trainings.new
  end

  def create
    p "training p #{training_params}"
    @training = current_user.trainings.create(training_params)
    puts @training
    if @training.save
      flash[:success] = "Training saved"
      redirect_to training_divisions_url
    else
       @training_division = TrainingDivision.find(@training.training_division_id)
       flash[:danger] = "Please, at least enter a date"
      redirect_to training_division_url(@training_division)
    end
  end

  def destroy
    @training.destroy
    flash[:success] = "Training deleted"

    redirect_to current_user || root_url
  end

  def update
      @training = current_user.trainings.find_by(id: params[:id])
    if @training.update_attributes(training_params)
      flash[:success] = "Training Updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def show
    @training = Training.find(params[:id])
    @training_division = TrainingDivision.find(@training.training_division_id)

  end

  def edit
    @training = Training.find(params[:id])
    @training_codes = TrainingCode.all
    if @training.training_division_id == 1
      @codes = @training_codes[0..6]
    elsif @training.training_division_id == 2
      @codes = @training_codes[7..12]
    elsif @training.training_division_id ==  3
      @codes = @training_codes[13..19]
    elsif @training.training_division_id  == 5
      @codes = @training_codes[20..24]
    elsif @training.training_division_id  == 6
      @codes = @training_codes[25..30]
    elsif @training.training_division_id == 7
      @codes = @training_codes[31..32]
    else @training.training_division_id == 8
      @codes = @training_codes[33..37]
    end
    @routes = @training_codes[38..69]
  end



  private
    def training_params
      params.require(:training).permit(:location, :training_date, :trainer, :training_division_id, :comments, :training_time, trainings_training_codes_attributes: [:id, :training_code_id, :_destroy])
    end


    def correct_user
      @training = current_user.trainings.find_by(id: params[:id])
      redirect_to root_url if @training.nil?
    end

end
