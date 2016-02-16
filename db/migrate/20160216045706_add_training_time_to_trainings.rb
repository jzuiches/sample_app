class AddTrainingTimeToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :training_time, :time
  end
end
