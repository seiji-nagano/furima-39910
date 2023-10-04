class DeliveryDays < ActiveHash::Base
  self.data = [
    { id: 1, delivery_days: '---' },
    { id: 2, delivery_days: '1~2日で発送' },
    { id: 3, delivery_days: '2~3日で発送' },
    { id: 4, delivery_days: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end