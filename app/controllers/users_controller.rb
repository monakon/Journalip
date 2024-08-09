class UsersController < ApplicationController
  # ログイン回避
  skip_before_action :require_login, only: %i[new create destroy]
  before_action :set_user, only: %i[destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザー登録が完了しました'
    else
      flash.now[:error] = 'ユーザー登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
      if @user.destroy
        redirect_to root_path, notice: '正常に削除されました'
      else
        redirect_to root_path, error: 'お手数ですがお問い合わせフォームより退会ご依頼をお願いします'
      end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find_by(:id => params[:id])
    end
end
