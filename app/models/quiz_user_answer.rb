class QuizUserAnswer < ApplicationRecord
  belongs_to :user    
  belongs_to :question, foreign_key: "quiz_question_id"  
  has_one :quiz, :through => :question
  belongs_to :option, foreign_key: "quiz_question_option_id"
end
