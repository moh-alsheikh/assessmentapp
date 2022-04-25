class QuizzesController < ApplicationController

  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all.order(id: :asc)
  end

  def show
    @quiz = Quiz.find(params[:id])    
    @questions = @quiz.questions
  end

  def new
    @quiz = Quiz.new(params[:quiz])    
  end

  def edit
    # @quiz = Quiz.find(params[:id])    
  end

  def create
    @quiz = Quiz.new(quiz_params)    
    if @quiz.save!      
      respond_to do |format|
        format.html { redirect_to quizzes_path, notice: "Quiz was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quiz was successfully created." }
      end
    else      
      flash[:error] = "Quiz not successfully created."      
      render :new
    end
  end  

  def update
    @quiz = Quiz.find(params[:id])    
    if @quiz.update(quiz_params)
      respond_to do |format|
        format.html { redirect_to quizzes_path, notice: "Quiz was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quiz was successfully updated." }
      end     
    else              
      flash[:error] = "Quiz not successfully updated."      
      render :new
    end      
  end
 
  def destroy            
    Quiz.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to quiz_path(@quiz), notice: "Quiz was successfully deleted." }
      format.turbo_stream { flash.now[:notice] = "Quiz was successfully deleted." }
    end
  end


  private    

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params      
      params.require(:quiz).permit(:name, :description)      
    end

end
