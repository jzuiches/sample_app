class Api::V1::TrainingSerializer < ActiveModel::Serializer
  attributes :id, :t_time, :training_date, :comments, :location, :trainer, :training_division_id

  has_many :training_codes


end
