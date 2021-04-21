class Artist < ApplicationRecord
  include AlgoliaSearch

  before_create do |artist|
    file = open("#{Rails.root.to_s}/app/assets/images/default-artist-avatar.jpg")
    artist.photo.attach(io: file, filename: 'default-artist-avatar.png', content_type: 'image/jpg')
  end
  before_destroy do |artist|
    artist.photo.purge
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :fan_artists, dependent: :destroy
  has_many :explorers, through: :fan_artists
  has_many :albums, dependent: :destroy
  has_many :musics, through: :albums
  has_many :plays, through: :musics

  validates :name, presence: true, uniqueness: true

  algoliasearch do
    attributes :name

    customRanking ['desc(fan_artists.count)']
  end

end
