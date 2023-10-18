class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :date_of_birth, :password_confirmation
    validates :real_first_name, :real_last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
    validates :main_first_name, :main_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
  end

  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include at least one letter and one digit' }
end
