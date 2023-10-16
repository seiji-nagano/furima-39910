class BuyForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end