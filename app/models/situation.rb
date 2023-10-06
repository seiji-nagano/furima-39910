class Situation < ActiveHash::Base
  self.data = [
    { id: 1, situation: '---' },
    { id: 2, situation: '新品・未使用' },
    { id: 3, situation: '未使用に近い' },
    { id: 4, situation: '目立った傷や汚れなし' },
    { id: 5, situation: 'やや傷や汚れあり' },
    { id: 6, situation: '傷や汚れあり' },
    { id: 7, situation: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end