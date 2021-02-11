class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fan_artists, dependent: :destroy
  has_many :explorers, through: :fan_artists

  validates :name, presence: true, uniqueness: true
end
