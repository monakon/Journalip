class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user)
  end

  def show
    @board = Board.find(params[:id])
  end
end

