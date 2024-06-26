class BoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]

  def index
    @boards = Board.includes(:user)
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      # 記事詳細に遷移するためリダイレクト先にIDを指定する
      redirect_to board_path(@board), notice: '記事を作成しました'
    else
      flash.now[:alert] = '記事作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '記事を更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, status: :see_other, alert: '削除しました'
  end

  def mypage
    @boards = Board.includes(:user).where(user_id: current_user.id)
  end

  private

  def set_board
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :opinion, :background, :emotion, :value)
  end
end

