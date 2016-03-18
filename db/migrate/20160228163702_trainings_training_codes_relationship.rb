class TrainingsTrainingCodesRelationship < ActiveRecord::Migration
  def change
     create_table :trainings_training_codes do |t|
      t.references :training, foreign_key: true
      t.references :training_code, foreign_key: true
      t.timestamps null: false
      end
    end
end