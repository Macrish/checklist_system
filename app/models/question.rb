class Question < ApplicationRecord
  belongs_to :checklist, inverse_of: :questions
end
