class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]


  def start
    if @test.questions.present?
      current_user.tests.push(@test)
      redirect_to current_user.user_test(@test)
    else 
      redirect_to root_path, notice: "Тест не возможно начать. У теста нет вопросов"
    end
  end

  def index
    @tests = Test.all
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
