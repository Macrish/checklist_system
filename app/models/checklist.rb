class Checklist < ApplicationRecord
	has_many :questions,  inverse_of: :checklist, dependent: :destroy
	belongs_to :user
	validates_presence_of :questions
	validates_associated :questions
	validates :title, presence: true, length: { minimum: 5, maximum: 140}
	validates :description, presence: true, length: { minimum: 5, maximum: 300}
	accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes[:question_text].blank? }, allow_destroy: true
end
