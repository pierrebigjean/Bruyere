class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :locations, dependent: :destroy
  has_many :ownerships, through: :locations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
