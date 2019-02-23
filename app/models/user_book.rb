class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  counter_culture :user, column_name: "books_count"
  counter_culture :book, column_name: "users_count"
  scope :borrowed_form_user_or_generate, ->(user_id) { find_or_initialize_by(user_id: user_id) }

  def borrow
    UserBook.transaction do
      raise "can't borrow a book" unless book.can_borrow

      save!
      true
    end
  rescue StandardError => e
    logger.error(e)
    false
  end
end
