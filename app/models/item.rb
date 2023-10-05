class Item < ApplicationRecord
  has_one :buy
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category_id
    validates :situation_id
    validates :liability_id
    validates :prefecture_id
    validates :delivery_days_id
    validates :price, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :situation_id
    validates :liability_id
    validates :prefecture_id
    validates :delivery_days_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :liability
  belongs_to :prefecture
  belongs_to :delivery_days

end
