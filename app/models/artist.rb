class Artist < ApplicationRecord
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

  validates :name, presence: true, uniqueness: true

end
