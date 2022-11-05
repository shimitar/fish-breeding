class Question < ApplicationRecord
  with_options presence: true do
    validates :question_text
    validates  :user_id
    validates  :fish_id
  end

  belongs_to :fish
  belongs_to :user
  has_many :answers
end
