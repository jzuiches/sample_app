class Api::V1::TrainingsController < ApplicationController
  def show
    user = User.find(params[:id])

    render json: user, serializer: Api::V1::UserSerializer

  end

  def create
    p "training p #{training_params}"
    user = User.find(training_params[:user_id])
    training = user.trainings.create(training_params)
    params[:training_codes].each do |code|
      code_lookup = TrainingCode.find_by(training_name: code[:training_name])
      TrainingsTrainingCode.create(training_id: training.id, training_code_id: code_lookup.id)
    end

    if training
      puts "training serialized #{training}"
      render json: training, serializer: Api::V1::TrainingSerializer
    else
      puts "training failed joe"
    end
  end

  def destroy
    training = Training.find(params[:id])
    training.destroy
    render json: params[:id]
  end



  private
    def training_params
      params.require(:training).permit(:user_id, :location, :training_date, :trainer, :training_division_id, :comments, :t_time, training_codes: [:training_name])
    end

end
