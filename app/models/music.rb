class Music < ApplicationRecord
  before_destroy do |music|
    music.audio_file.purge
  end

  belongs_to :album

  has_one_attached :audio_file

  has_many :fan_musics, dependent: :destroy
  has_many :explorers, through: :fan_musics
  has_many :playlist_musics, dependent: :destroy

  validates :name, presence: true
  # validates_attachment :audio_file, presence: true, content_type: ['audio/mp3', 'audio/mp4', 'audio/mpeg']

end
