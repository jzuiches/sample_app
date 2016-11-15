class Api::V1::TrainingCodeSerializer < ActiveModel::Serializer
  attributes :id, :code, :training_name
end
