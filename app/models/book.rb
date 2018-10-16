class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books
  validates :title, presence: true, length: { maximum: 200 }
  validates :author, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :total_stock, presence: true, numericality: { only_integer: true }
  validate :total_stock_must_be_more_than_borrowed, if: :id?

  def total_stock_must_be_more_than_borrowed
    errors.add(:total_stock, 'total_stockより大きい数字にはできません') if total_stock < user_books.count
  end

  def can_borrow
    total_stock > user_books.count
  end
end
