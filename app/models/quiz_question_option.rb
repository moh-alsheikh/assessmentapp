class QuizQuestionOption < ApplicationRecord
  
  belongs_to :quiz_question

  # validates_presence_of :question_option_text, :is_correct, message: "can't be blank"
  
end
