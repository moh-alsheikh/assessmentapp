class Option < ApplicationRecord
  
  self.table_name = "quiz_question_options"
  
  belongs_to :question, foreign_key: "quiz_question_id"

  validates_presence_of :question_option_text, message: "can't be blank"

  validates_acceptance_of :is_correct, message: "You must select at least one correct answer", if: :require_one_option?

  # validate :require_one_option

  private
    def require_one_option?
      self.question.options.where.not(id: self.id).where(is_correct: true).count == 0 ? true : false        
    end   
  
end
