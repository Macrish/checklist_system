class Question < ApplicationRecord
  belongs_to :form, inverse_of: :questions
  validates :question_text, presence: true, length: { minimum: 5, maximum: 140}
	validates :question_description, presence: true, length: { minimum: 5, maximum: 300}
end
