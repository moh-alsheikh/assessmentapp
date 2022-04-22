class QuizQuestion < ApplicationRecord  

  belongs_to :quiz  
  has_many :options, class_name: "QuizQuestionOption", dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true

  validates_presence_of :question_text, message: "can't be blank"
  validate :require_one_option

  
  private
    def require_one_option             
      errors.add(:correct, "You must select at least one correct answer") unless options.map{ |x| x[:is_correct]}.include? true
    end      
    

    # def require_one_option
    #   questions.each do |question|       
    #     errors.add(:correct, "You must select at least one correct answer") unless question.options.map{ |x| x[:is_correct]}.include? true
    #   end      
    # end

  # def validate_options
  #   puts "\n\n VALIDATE OPTIONS COUNT \n\n"
  #   sleep 2
  #   correct_answers = self.options.where(is_correct: true)
  #   if correct_answers.count == 0
  #     errors.add(:options, :blank, message: "You must select 1 correct anser")
  #   end
  # end

  


end
