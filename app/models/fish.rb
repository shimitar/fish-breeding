class Fish < ApplicationRecord

  belongs_to :user
  has_one    :breeding
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
