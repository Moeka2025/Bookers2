class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  def self.find_for_database_authentication(warden_conditions)
    name = warden_conditions[:name] || warden_conditions["name"]
    where(name: name).first
  end

  has_many :books, dependent: :destroy
  
end
