class UserTestsController < ApplicationController
  before_action :set_user_test, only: %i[gist show update result ]
  before_action :authenticate_user!

  def show
  end

  def update
    @user_test.accept!(params[:answer_ids])
    if @user_test.complited?
      TestsMailer.complited_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end

  def gist
    @user = current_user
    gist_service = GistQuestionService.new(@user_test.current_question)
    result = gist_service.call
    if gist_service.success?
      current_user.gist.create(question_id: @user_test.current_question.id, url: result[:html_url] )
      flash_option = {notice: result[:html_url]}
    else
      flash_option = {alert: 'error'}
    end
    redirect_to @user_test, flash_option
  end
  
  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end

  def gist_params
    params.require(:gist).permit(:question_id, :user_id, :url)
  end
end
