class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = Question.all
    @test = Test.find(params[:test_id])
    render inline: '<% @questions.where(test_id: @test).each do |question| %> <br> <%= question.body %> <% end %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
    @test_id = Test.find(params[:test_id])
    @test = @test_id.id
  end

  def create
    @test = Test.find(params[:test_id])
    question = @test.questions.create(question_params)
    #question = Question.create(question_params)
    respond_to do |format|
      if question.save
        #render plain: question.inspect
        format.html { redirect_to test_questions_url, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body,:test_id)
  end
  
  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
