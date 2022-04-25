class Question < ApplicationRecord  

  self.table_name = "quiz_questions"
  belongs_to :quiz  
  has_many :options, foreign_key: :quiz_question_id,dependent: :destroy

  validates_presence_of :question_text, message: "can't be blank"
  

  scope :ordered, -> { order(created_at: :asc) }
  
  def previous_date
    quiz.questions.ordered.where('created_at < ?', created_at).last
  end
    
end

