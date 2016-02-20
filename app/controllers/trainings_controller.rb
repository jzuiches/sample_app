class TrainingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @training = current_user.trainings.create(training_params)
    if @training.save
      flash[:success] = "Training saved"
      redirect_to training_divisions_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def show
    @training = Training.find(params[:id])
    @training_division = TrainingDivision.find(@training.training_division_id)

  end

  def edit
    @training = Training.find(params[:id])
  end


  private
    def training_params
      params.require(:training).permit(:location, :training_date, :trainer, :training_division_id, :comments, :training_time, :training_code)
    end
end

