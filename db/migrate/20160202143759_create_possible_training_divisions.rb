class CreatePossibleTrainingDivisions < ActiveRecord::Migration
  def change
    create_table :possible_training_divisions do |t|
      t.references :user, foreign_key: true
      t.references :training_division, foreign_key: true
      t.timestamps null: false
    end
  end
end
