class Album < ApplicationRecord
  include AlgoliaSearch

  before_destroy do |album|
    album.photo.purge
  end

  belongs_to :artist


  has_one_attached :photo

  has_many :musics, dependent: :destroy
  has_many :plays, through: :musics
  accepts_nested_attributes_for :musics
  has_many :fan_albums, dependent: :destroy
  has_many :explorers, through: :fan_albums

  validates :name, presence: true
  validates :photo, presence: true

  algoliasearch do
    attributes :name

    customRanking ['desc(fan_albums.count)']
  end
end
