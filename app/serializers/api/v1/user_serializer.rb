class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :activated,  :admin, :created_at, :updated_at

  has_many :trainings

  def trainings
    customized_trainings = []

    object.trainings.each do |training|
        custom_training = training.attributes

        custom_training[:training_codes] = training.training_codes.collect{|training_code| training_code.slice(:id, :code, :training_name)}

        customized_trainings.push(custom_training)
      end
      return customized_trainings

    end

end
