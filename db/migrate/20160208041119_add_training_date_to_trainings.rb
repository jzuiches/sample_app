class AddTrainingDateToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :training_date, :date
  end
end
