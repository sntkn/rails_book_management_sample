require 'rails_helper'

feature 'my_page/index' do

  context '借りている時' do
    let(:book_with_user) { FactoryBot.create(:book, :with_users) }

    scenario '貸出中リストが表示されること' do
      login_as book_with_user.users[0], scope: :user
      visit my_pages_path(book_with_user.id)
      expect(page).to have_content '貸出中の書籍'
    end
  end

  context '借りていないとき' do
    let(:user) { FactoryBot.create(:user) }

    scenario 'リストが表示されないこと' do
      login_as user, scope: :user
      visit my_pages_path(user)
      expect(page).to have_content '貸出中の書籍はありません'
    end
  end
end
