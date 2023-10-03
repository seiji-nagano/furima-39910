class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :real_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "must be full-width katakana" }, if: :is_kana_name?
  validates :real_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "must be full-width katakana" }, if: :is_kana_name?
  validates :main_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "must be full-width katakana" }, unless: :is_kana_name?
  validates :main_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "must be full-width katakana" }, unless: :is_kana_name?
  validates :date_of_birth, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: "must include at least one letter and one digit" }

  # has_many :items
  # has_many :buys
end

def is_kana_name?
  real_last_name.present? && real_first_name.present?
end
