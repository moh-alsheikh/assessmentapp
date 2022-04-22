class CreateQuizUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_user_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz_question, null: false, foreign_key: true
      t.references :quiz_question_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
