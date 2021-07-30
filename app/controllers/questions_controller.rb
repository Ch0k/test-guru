class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index
    render inline: '<% Question.all.each do |question| %> <br> <%= question.body %> <% end %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @order.destroy
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
