class BoardsController < ApplicationController
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
      redirect_to @board, notice: '記事を作成しました'
    else
      flash.now[:alert] = '記事作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :opinion, :background, :emotion, :value)
  end
end

