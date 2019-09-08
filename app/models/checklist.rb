class Checklist < ApplicationRecord
	has_many :questions
	belongs_to :user
end
