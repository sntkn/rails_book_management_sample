require 'rails_helper'

feature 'books/index' do
  context '本が登録されている時' do
    let(:books) do
      FactoryBot.create_list(:book, 3)
    end

    scenario '本のリストが表示されること' do
      visit books_path
      expect(page).to have_content 'タイトル'
    end
  end
end
