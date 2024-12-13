class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments, required: true
end
