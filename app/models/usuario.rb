class Usuario < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  has_many :productos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
end
