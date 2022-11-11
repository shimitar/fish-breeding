class Answer < ApplicationRecord
  with_options presence: true do
    validates  :answer_text
    # validates  :user_id
    # validates  :fish_id
    # validates  :question_id
  end

  belongs_to :user
  belongs_to :fish
  belongs_to :question
end
