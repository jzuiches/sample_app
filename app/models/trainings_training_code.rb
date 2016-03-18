class TrainingsTrainingCode < ActiveRecord::Base
belongs_to :training
belongs_to :training_code

accepts_nested_attributes_for :training_code, allow_destroy: true

end