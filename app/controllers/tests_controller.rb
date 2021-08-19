class TestsController < ApplicationController
  before_action :set_test, only: %i[start show edit update destroy ]
  before_action :set_user, only: :start

  def start
    @user.tests.push(@test)
    redirect_to @user.user_test(@test)
  end

  def set_user
    @user = User.first
  end

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
