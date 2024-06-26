class StaticpagesController < ApplicationController
  # ログイン回避
  skip_before_action :require_login, only: %i[top]

  def top
    @boards = Board.order(created_at: :desc).limit(6)
  end
end
