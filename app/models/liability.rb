class Liability < ActiveHash::Base
  self.data = [
    { id: 1, liability: '---' },
    { id: 2, liability: '着払い(購入者負担)' },
    { id: 3, liability: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end