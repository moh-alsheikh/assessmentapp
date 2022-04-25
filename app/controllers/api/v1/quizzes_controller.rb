class Api::V1::QuizzesController < Api::V1::AppController

  before_action :authenticate_with_token!

  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all.order(id: :asc)
    render json: { quizzes: @quizzes }    
  end

  def show
    @quiz = Quiz.find(params[:id])    
    @questions = @quiz.questions
    render json: { quiz: @quiz,questions:  @questions } 
  end

  private    

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params      
      params.require(:quiz).permit(:name, :description)      
    end

end
