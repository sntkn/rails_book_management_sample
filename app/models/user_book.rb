class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :borrowed_form_user_or_generate, ->(user_id) { find_or_initialize_by(user_id: user_id) }
end
