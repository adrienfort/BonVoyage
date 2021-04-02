class Explorer < ApplicationRecord
  before_create do |explorer|
    file = open("#{Rails.root.to_s}/app/assets/images/default-explorer-avatar.png")
    explorer.photo.attach(io: file, filename: 'default-explorer-avatar.png', content_type: 'image/png')
  end

  after_create do |explorer|
    playlist = Playlist.new(name: "Bon Voyage", explorer: explorer)
    file = open("#{Rails.root.to_s}/app/assets/images/logo.png")
    playlist.photo.attach(io: file, filename: 'default-bonvoyage-playlist-logo', content_type: 'image/png')
    playlist.save
  end

  before_destroy do |explorer|
    explorer.photo.purge
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :fan_albums, dependent: :destroy
  has_many :fan_artists, dependent: :destroy
  has_many :fan_musics, dependent: :destroy
  has_many :artists, through: :fan_artists
  has_many :albums, through: :fan_albums
  has_many :musics, through: :fan_musics
  has_many :playlists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true

end
