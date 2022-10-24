class Breed < ApplicationRecord
  with_options presence: true do
    validates  :fish_id
    validates  :user_id
  end
  
  belongs_to :user
  belongs_to :fish 
end
