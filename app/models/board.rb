class Board < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :opinion, presence: true, length: { maximum: 65_535 }
  validates :background, presence: true, length: { maximum: 65_535 }
  validates :emotion, presence: true, length: { maximum: 255 }
  validates :value, presence: true, length: { maximum: 65_535 }
end
