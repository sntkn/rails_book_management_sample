require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) do
    FactoryBot.create(:book, :with_users)
  end

  context 'バリデーション' do
    it '所蔵数は貸出数未満の数字を入力したらNG' do
      book.total_stock = book.users.count - 1
      book.valid?
      expect(book).to be_invalid
    end
    it '所蔵数は貸出数と同じ数字を入力したらOK' do
      book.total_stock = book.users.count
      book.valid?
      expect(book).to be_valid
    end
    it '所蔵数は貸出数より大きい数字を入力したらOK' do
      book.total_stock = book.users.count + 1
      book.valid?
      expect(book).to be_valid
    end
  end

  context '借りられるかを判定' do
    it '所蔵数が貸出数より多ければOK' do
      expect(book.can_borrow).to eq(true)
    end
    it '所蔵数と貸出数が同じはNG' do
      book = FactoryBot.create(:book, :stock_1, :with_users)
      expect(book.can_borrow).to eq(false)
    end

    it '所蔵数が貸出数より少なければNG' do
      book = FactoryBot.create(:book, :stock_zero, :with_users)
      expect(book.can_borrow).to eq(false)
    end
  end
end
