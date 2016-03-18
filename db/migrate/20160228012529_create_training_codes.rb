class CreateTrainingCodes < ActiveRecord::Migration
  def change
    create_table :training_codes do |t|
      t.references :training, foreign_key: true
      t.integer :code
      t.string :training_name

      t.timestamps null: false
    end
  end
end
