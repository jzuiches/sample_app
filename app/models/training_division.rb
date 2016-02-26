class TrainingDivision < ActiveRecord::Base
  has_many :possible_training_divisions
  has_many :users, through: :possible_training_divisions
  has_many :trainings


end
