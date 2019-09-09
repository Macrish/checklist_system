class Checklist < ApplicationRecord
	has_many :questions,  inverse_of: :checklist, dependent: :destroy
	belongs_to :user

	accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes[:question_text].blank? }, allow_destroy: true
end
