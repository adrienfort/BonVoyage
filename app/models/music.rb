class Music < ApplicationRecord
  include AlgoliaSearch

  before_destroy do |music|
    music.audio_file.purge
  end

  belongs_to :album

  has_one_attached :audio_file

  has_many :plays, dependent: :destroy
  has_many :fan_musics, dependent: :destroy
  has_many :explorers, through: :fan_musics
  has_many :playlist_musics, dependent: :destroy

  validates :name, presence: true
  validates :audio_file, presence: true

  algoliasearch do
    attributes :name

    customRanking ['desc(fan_musics.count)']
  end
end
