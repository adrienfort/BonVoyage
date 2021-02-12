class Explorer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fan_albums, dependent: :destroy
  has_many :fan_artists, dependent: :destroy
  has_many :fan_musics, dependent: :destroy
  has_many :artists, through: :fan_artists
  has_many :albums, through: :fan_albums
  has_many :musics, through: :fan_musics

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
end
