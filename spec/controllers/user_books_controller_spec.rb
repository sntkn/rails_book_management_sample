require 'rails_helper'

RSpec.describe UserBooksController, type: :controller do
  let(:user) do
    FactoryBot.create(:user)
  end
  let(:book) do
    FactoryBot.create(:book)
  end
  let(:valid_session) { {} }
  describe 'POST #create' do
    context '正しいパラメータが渡された時' do
      before do
        sign_in user
      end
      let(:valid_params) { { book_id: book.id } }
      it 'データが登録されること' do
        expect do
          post :create, params: { user_book: valid_params }, session: valid_session
        end.to change(UserBook, :count).by(1)
      end

      let(:book) { FactoryBot.create(:book) }
      let(:valid_params) { { book_id: book.id } }
      it "書籍ページにリダイレクトすること" do
        post :create, params: {user_book: valid_params}, session: valid_session
        expect(response).to redirect_to(book)
      end
    end

    context "不正なパラメータが渡された時" do
      before do
        sign_in user
      end
      let(:invalid_params) { { book_id: 0 } }
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {user_book: invalid_params}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    context '正しいパラメータが渡された時' do
      let(:book_with_users) { FactoryBot.create(:book, :with_users) }
      before do
        sign_in book_with_users.users[0]
      end

      it 'データが削除されること' do
        expect do
          delete :destroy, params: { id: book_with_users.user_books[0].id }
        end.to change(UserBook, :count).by(-1)
      end

      let(:book_with_users) { FactoryBot.create(:book, :with_users) }
      it "書籍ページにリダイレクトすること" do
        delete :destroy, params: { id: book_with_users.user_books[0].id }
        expect(response).to redirect_to(book_with_users)
      end
    end
  end
end
