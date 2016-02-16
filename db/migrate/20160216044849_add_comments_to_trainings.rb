class AddCommentsToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :comments, :text
  end
end
