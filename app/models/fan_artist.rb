class FanArtist < ApplicationRecord
  belongs_to :explorer
  belongs_to :artist

  validates :explorer, uniqueness: { scope: :artist }
end
