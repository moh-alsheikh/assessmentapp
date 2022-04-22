class QuizUserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_question
  belongs_to :quiz_question_option
end
