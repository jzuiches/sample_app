class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.references :user, foreign_key: true
      t.references :training_division
      t.string :location
      t.string :trainer


      t.timestamps null: false
    end
  end
end
