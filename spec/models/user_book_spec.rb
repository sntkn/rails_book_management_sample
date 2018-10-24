require 'rails_helper'

RSpec.describe UserBook, type: :model do
  describe 'borrowed_form_user_or_generate' do
    context '借りている時' do
      let(:book_with_users) { FactoryBot.create(:book, :with_users) }
      it 'user_bookオブジェクトを取得できること' do
        user_book = book_with_users.user_books.borrowed_form_user_or_generate(book_with_users.users[0].id)
        expect(user_book.id).to eq book_with_users.user_books[0].id
      end
    end
    context '借りてない時' do
      let(:book) { FactoryBot.create(:book) }
      let(:user) { FactoryBot.create(:user) }
      it 'idのないuser_bookオブジェクトを取得できること' do
        user_book = book.user_books.borrowed_form_user_or_generate(user.id)
        expect(user_book.id).to eq nil
      end
      it '本を借りられること' do
        user_book = book.user_books.borrowed_form_user_or_generate(user.id)
        result = user_book.borrow
        expect(result).to eq true
      end
    end
  end
end
