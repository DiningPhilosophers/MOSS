class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :person_id
      t.integer :question_id
      t.string :answer

      t.timestamps null: false
    end
  end
end
