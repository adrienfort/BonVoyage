class Music < ApplicationRecord
  belongs_to :album

  has_many :fan_musics, dependent: :destroy
  has_many :explorers, through: :fan_musics

  validates :name, presence: true
end
