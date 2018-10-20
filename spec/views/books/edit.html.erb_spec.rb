require 'rails_helper'

feature 'books/show' do
  let(:book) { FactoryBot.create(:book) }

  scenario '更新ボタンを押して更新できること' do
    visit edit_book_path(book.id)
    click_on '書籍更新'
    expect(page).to have_content 'Book was successfully updated.'
  end

  context '例外系' do
    let!(:book) { FactoryBot.create(:book, :with_users) }

    scenario '借りている数より小さい数字に更新できないこと' do
      visit edit_book_path(book.id)
      fill_in '所蔵数', with: 0
      click_on '書籍更新'
      expect(page).to have_content '所蔵数 より少ない数字にはできません'
    end
  end
end
