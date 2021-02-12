class Playlist < ApplicationRecord
  belongs_to :explorer

  validates :name, presence: true

end
