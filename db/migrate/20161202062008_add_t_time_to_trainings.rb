class AddTTimeToTrainings < ActiveRecord::Migration[5.0]
  def change
    add_column :trainings, :t_time, :string
  end
end
