class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  # placeフィールドから緯度と経度を取得するためにgeocoderを設定
  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  validates :title, presence: true, length: { maximum: 255 }
  validates :opinion, presence: true, length: { maximum: 65_535 }
  validates :background, presence: true, length: { maximum: 65_535 }
  validates :emotion, presence: true, length: { maximum: 255 }
  validates :value, presence: true, length: { maximum: 65_535 }
end
