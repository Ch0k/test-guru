class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_test,  only: %i[ index create new]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render inline: '<% @test.questions.each do |question| %> <br> <%= question.body %> <% end %>'
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
      if @question.save
        redirect_to test_url(@test), notice: 'Question was successfully created.'
      else
        render :new
      end
  end

  def destroy
    @question.destroy
    redirect_to test_url(@question.test), notice: 'Question was successfully delete.'
  end
  
  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_url(@question.test), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
  
  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end
