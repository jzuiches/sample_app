class CreateTrainingDivisions < ActiveRecord::Migration
  def change
    create_table :training_divisions do |t|
      t.string :training_type
      t.references :user


      t.timestamps null: false
    end
  end
end
