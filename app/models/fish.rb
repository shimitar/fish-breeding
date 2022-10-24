class Fish < ApplicationRecord
  with_options presence: true do
    validates :name
    validates  :size
    validates  :fish_text
    validates  :category_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates  :image
    validates  :user_id
  end
  
  belongs_to :user
  has_one    :breed, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  
end
