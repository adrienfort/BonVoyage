class FanAlbum < ApplicationRecord
  belongs_to :album
  belongs_to :explorer
end
