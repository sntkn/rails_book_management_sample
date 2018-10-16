class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :borrowed, ->(user_id) { find_or_initialize_by(user_id: user_id) }
end
