class AddTrainingCodesToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :training_code, :integer
  end
end
