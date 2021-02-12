class Playlist < ApplicationRecord
  belongs_to :explorer

  has_many :playlist_musics, dependent: :destroy
  has_many :musics, through: :playlist_musics

  validates :name, presence: true

end
