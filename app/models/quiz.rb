class Quiz < ApplicationRecord
  
  has_many :questions, class_name: "QuizQuestion", dependent: :destroy
  has_many :options, class_name: "QuizQuestionOption", through: :questions

  validates_presence_of :name, :description, message: "can't be blank"  

  accepts_nested_attributes_for :questions, allow_destroy: true

  
  
end


__END__

Quiz.first.questions.each do |question|
  puts "\n #{question.options.where(is_correct: true).count} \n"
end