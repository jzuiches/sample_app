class TrainingCode < ActiveRecord::Base
has_many :trainings_training_codes
has_many :trainings, through: :trainings_training_codes
end