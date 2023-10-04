class Item < ApplicationRecord
  has_one :buy
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :liability_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, presence: true

  def was_attached?
    self.image.attached?
  end
end
