class Music < ApplicationRecord
  belongs_to :album

  has_one_attached :photo

  has_many :fan_musics, dependent: :destroy
  has_many :explorers, through: :fan_musics
  has_many :playlist_musics, dependent: :destroy

  validates :name, presence: true
end
