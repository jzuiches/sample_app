class ChangeTrainingCodeInTraining < ActiveRecord::Migration
def self.up
    remove_column :trainings, :training_code
    add_reference :trainings, :training_code
  end

  def self.down
    remove_reference :trainings, :training_code
    add_column :trainings, :training_code, :integer
  end
end
