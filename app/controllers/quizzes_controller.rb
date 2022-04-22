class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all.order(id: :asc)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new(params[:quiz])
    1.times do
      @questions = @quiz.questions.build
      3.times do
        @questions.options.build    
      end
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    # 1.times do
    #   @questions = @quiz.questions.build
    #   3.times do
    #     @questions.options.build    
    #   end
    # end
  end

  def create
    @quiz = Quiz.new(quiz_params)    
    if @quiz.save!
      flash[:notice] = "Quiz successfully created."     
      redirect_to quizzes_path
    else      
      flash[:error] = "Quiz not successfully created."      
      redirect_to quizzes_path
    end
  end  

  def update
    @quiz = Quiz.find(params[:id])    
    if @quiz.update(quiz_params)
      # Don't ask current quiz to sign in again after password changed 
      flash[:notice] = "Quiz successfully updated."     
      redirect_to quizzes_path
    else 
      flash[:error] = "Quiz not successfully updated."      
      redirect_to quizzes_path
    end    
  end
 
  def destroy
    Quiz.find(params[:id]).destroy    
    flash[:notice] = "Quiz successfully deleted."
    redirect_to quizzes_path
  end


  private    
    def quiz_params
      # params.require(:quiz).permit(:name, :description, :question_attributes: [:question_text], option_attributes: [:question_option_text, :is_correct])
      params.require(:quiz).permit!
    end

end
