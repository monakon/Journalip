class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :boards, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  def own?(object)
    object.user_id == id
  end

  # Bookmark用メソッド

  # 特定の掲示板をユーザーのブックマークに追加する
  def bookmark(board)
    bookmark_boards << board
  end

  # 特定の掲示板をユーザーのブックマークから削除する
  def unbookmark(board)
    bookmark_boards.destroy(board)
  end

  # 特定の掲示板がユーザーのブックマークに含まれているかを確認する
  def bookmark?(board)
    bookmark_boards.include?(board)
  end
end
