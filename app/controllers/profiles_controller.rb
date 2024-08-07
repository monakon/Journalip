class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def show; end
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profiles_path, notice: '更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
