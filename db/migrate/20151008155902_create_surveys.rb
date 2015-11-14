class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :group_id, null: false
      t.integer :question_id, null: false
      t.string :answer, null: false

      # t.timestamps null: false
    end
  end
end
