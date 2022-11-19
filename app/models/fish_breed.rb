require 'active_model'

class FishBreed
  include ActiveModel::Model
  attr_accessor :user_id, :fish_id, :name, :category_id, :size, :fish_text, :image, :tank_size, :temperature, :filter, :raito,
                :condition, :sand, :plant, :breeding_text

  with_options presence: true do
    validates :name
    validates  :size, format: { with: /cm\z|m\z/ }
    validates  :fish_text
    validates  :category_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates  :image
    validates  :user_id
  end

  def save
    fish = Fish.create(name: name, user_id: user_id, size: size, fish_text: fish_text, category_id: category_id, image: image)
    Breed.create(tank_size: tank_size, temperature: temperature, filter: filter, raito: raito, condition: condition,
                 sand: sand, plant: plant, breeding_text: breeding_text, fish_id: fish.id, user_id: user_id)
  end
end
