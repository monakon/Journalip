require 'rails_helper'

RSpec.describe Board, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      board = build(:board)
      expect(board).to be_valid
      expect(board.errors).to be_empty
    end
  end
end
