require 'rails_helper'

feature 'books/show' do
  context 'ログインしていてないとき' do
    let(:book) { FactoryBot.create(:book) }
    scenario '貸し借りできないこと' do
      visit book_path(book)
      expect(page).to have_content '本を貸し借りするにはログインが必要です'
    end
  end

  context 'ログインしていて借りている時' do
    let(:book_with_user) { FactoryBot.create(:book, :with_users) }

    scenario '返却ボタン表示' do
      login_as book_with_user.users[0], scope: :user
      visit book_path(book_with_user.id)
      expect(page).to have_button 'この本を返す'
    end

    scenario '返すボタンを押して本を返せること' do
      login_as book_with_user.users[0], scope: :user
      visit book_path(book_with_user.id)
      click_on 'この本を返す'
      expect(page).to have_content 'UserBook was successfully destroyed'
    end
  end

  context 'ログインしていて借りていないとき' do
    let(:user) { FactoryBot.create(:user) }
    let(:book) { FactoryBot.create(:book) }

    scenario '借りるボタンが表示されること' do
      login_as user, scope: :user
      visit book_path(book)
      expect(page).to have_button 'この本を借りる'
    end

    scenario '借りるボタンを押して本を借りられること', use_truncation: true do
      login_as user, scope: :user
      visit book_path(book)
      click_on 'この本を借りる'
      expect(page).to have_content 'UserBook was successfully updated'
    end

    let(:user) { FactoryBot.create(:user) }
    let(:book_zero_stock) { FactoryBot.create(:book, :stock_zero) }

    scenario '借りれないこと' do
      login_as user, scope: :user
      visit book_path(book_zero_stock)
      expect(page).to have_content '借りられない'
    end
  end
end
