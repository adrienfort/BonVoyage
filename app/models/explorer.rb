class Explorer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fan_artists, dependent: :destroy
  has_many :artists, through: :fan_artists

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
end
