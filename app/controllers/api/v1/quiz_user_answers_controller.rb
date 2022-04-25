class Api::V1::QuizUserAnswersController < Api::V1::AppController

  before_action :authenticate_with_token!
  
  def create
    @quiz_user_answer = QuizUserAnswer.new(quiz_user_answer_params)    
    if @quiz_user_answer.save!      
      render json: "Answer saved successfully", status: 200
    else      
      render json: { errors: "Quiz not successfully created." }, status: 422
    end
  end  


  private    

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_user_answer_params                                                               
      params.require(:quiz_user_answer).permit(:user_id, :quiz_question_id, :quiz_question_option_id)      
    end

end