class ChangeTrainingReference < ActiveRecord::Migration
  def change
    remove_reference :training_codes, :training
    add_reference :training_codes, :trainings_training_codes
  end
end
