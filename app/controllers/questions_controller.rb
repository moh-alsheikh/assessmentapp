class QuestionsController < ApplicationController

  before_action :set_quiz
  before_action :set_question, only: [:edit, :update, :destroy]
  

  def index
    @questions = Question.all.order(id: :asc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new        
    @question = @quiz.questions.build         
  end

  def edit    
  end  

  def create
    @question = @quiz.questions.build(question_params)

    if @question.save
      respond_to do |format|
        format.html { redirect_to quiz_path(@quiz), notice: "Question was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Question was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end



  def update            
    if @question.update(question_params)
      respond_to do |format|
        format.html { redirect_to quiz_path(@quiz), notice: "Question was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Question was successfully updated." }
      end
    else
        render :edit, status: :unprocessable_entity
    end     
  end
 
  def destroy    
    @question.destroy

    respond_to do |format|
        format.html { redirect_to quiz_path(@quiz), notice: "Question was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Question was successfully destroyed." }
    end

  end


  private

    def question_params      
      params.require(:question).permit(:question_text)
    end    

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end
    
    def set_question
      @question = @quiz.questions.find(params[:id])
    end

end
