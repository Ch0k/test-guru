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
    result = GistQuestionService.new(@user_test.current_question).call
    Gist.create(question_id: @user_test.current_question.id, user_id: current_user.id, url: result[:html_url] )

      flash_option = if result.success?
        {notice: result[:html_url]}
      else
        {alert: 'error'}
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
