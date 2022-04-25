class OptionsController < ApplicationController

  before_action :set_quiz
  before_action :set_question
  before_action :set_option, only: [:edit, :update, :destroy]

  
  
  # def index
  #   @questions = Question.all.order(id: :asc)
  # end

  # def show
  #   @option = Option.find(params[:id])
  # end

  def new            
    @option = @question.options.build  
  end

  def edit    
  end  

  def create
    
    @option = @question.options.build(option_params)
    @option.quiz_question_id = @question.id
    if @option.save
      respond_to do |format|
        format.html { redirect_to quiz_path(@quiz), notice: "Option was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Option was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end



  def update         
    @option.quiz_question_id = @question.id   
    if @option.update(option_params)
      respond_to do |format|
        format.html { redirect_to quiz_path(@quiz), notice: "Option was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Option was successfully updated." }
      end
    else
        render :edit, status: :unprocessable_entity
    end     
  end
 
  def destroy    
    @option.destroy

    respond_to do |format|
        format.html { redirect_to quiz_path(@quiz), notice: "Option was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Option was successfully destroyed." }
    end

  end


  private   

    def option_params      
      params.require(:option).permit(:question_option_text, :is_correct)
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end
    
    def set_question
      @question = @quiz.questions.find(params[:question_id])
    end

    def set_option
      @option = @question.options.find(params[:id])
    end

end
