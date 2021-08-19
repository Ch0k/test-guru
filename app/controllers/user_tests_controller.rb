class UserTestsController < ApplicationController
  before_action :set_user_test, only: %i[ show update result ]

  def show
  end

  def update
    @user_test.accept!(params[:answer_ids])
    if @user_test.complited?
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end
  
  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end
  
end
