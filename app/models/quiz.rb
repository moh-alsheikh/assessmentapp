class Quiz < ApplicationRecord
  
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions

  validates_presence_of :name, :description, message: "can't be blank"  

  broadcasts_to ->(quiz) { "quizzes" }, inserts_by: :prepend

  scope :ordered, -> { order(created_at: :asc) }
  
  def previous_date
    where('created_at < ?', created_at).last
  end
  

end
