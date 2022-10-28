class Answer < ApplicationRecord
  with_options presence: true do
    validates :answer_text
  end

  belongs_to :user
  belongs_to :question
end
