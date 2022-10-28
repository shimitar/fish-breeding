class Question < ApplicationRecord
  with_options presence: true do
    validates :question_text
  end

  belongs_to :fish
  belongs_to :user
  has_many :answers
end
