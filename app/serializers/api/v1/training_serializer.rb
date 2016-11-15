class Api::V1::TrainingSerializer < ActiveModel::Serializer
  attributes :id, :training_date, :comments, :location, :trainer, :training_division_id
  has_many :trainings_training_codes
  has_many :training_codes
end
