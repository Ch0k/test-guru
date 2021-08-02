class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_test,  only: %i[ index create new ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render inline: '<% @test.questions.each do |question| %> <br> <%= question.body %> <% end %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
    @test_id = @test.id
  end

  def create
    @test = Test.find(params[:test_id])
    question = @test.questions.new(question_params)
    #question = Question.create(question_params)
      if question.save
        #render plain: question.inspect
        redirect_to test_questions_url, notice: 'Question was successfully created.'
      else
        render :new
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
    params.require(:question).permit(:body)
  end
  
  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end
