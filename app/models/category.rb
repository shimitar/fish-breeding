class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'カラシン' },
    { id: 3, name: 'コイ・ローチ' },
    { id: 4, name: 'メダカ' },
    { id: 5, name: 'ナマズ' },
    { id: 6, name: 'シクリッド' },
    { id: 7, name: 'アナバンテッド' },
    { id: 8, name: '古代魚' },
    { id: 9, name: '日本産淡水魚' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :fishes
end
