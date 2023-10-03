class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :real_last_name, presence: true
  validates :real_first_name, presence: true
  validates :main_last_name, presence: true
  validates :main_first_name, presence: true
  validates :date_of_birth, presence: true

  has_many :items
  has_many :buys
end
