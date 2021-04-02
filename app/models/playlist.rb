class Playlist < ApplicationRecord
  before_destroy do |playlist|
    playlist.photo.purge
  end

  belongs_to :explorer

  has_one_attached :photo

  has_many :playlist_musics, dependent: :destroy
  has_many :musics, through: :playlist_musics

  validates :name, presence: true

end
