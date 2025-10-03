class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_one_attached :profile_image

  has_many :books, dependent: :destroy

  def self.find_for_database_authentication(warden_conditions)
    name = warden_conditions[:name] || warden_conditions["name"]
    where(name: name).first
  end

  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize_to_fill: [width, height])
    else
      "no_image.jpg"
    end
  end
end
