class ChangeDataTypeForTrainingTime < ActiveRecord::Migration
  def self.up
    remove_column :trainings, :training_time
    add_column :trainings, :training_time, :float
  end

  def self.down
    remove_column :trainings, :training_time
    add_column :trainings, :training_time, :time
  end
end
