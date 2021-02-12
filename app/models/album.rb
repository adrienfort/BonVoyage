class Album < ApplicationRecord
  belongs_to :artist

  has_many :musics, dependent: :destroy
  has_many :fan_albums, dependent: :destroy
  has_many :explorers, through: :fan_albums

  validates :name, presence: true
end
