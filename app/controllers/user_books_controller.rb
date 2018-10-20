class UserBooksController < ApplicationController
  before_action :authenticate_user!

  def create
    user_book = UserBook.new(user_book_params.merge(user_id: current_user.id))
    return redirect_to root_path, warning: 'エラーが発生しました' unless user_book.book.present?

    User.transaction(isolation: :serializable) do
      raise 'error' unless user_book.book.can_borrow

      user_book.save!
      redirect_to user_book.book, success: '書籍を借りました'
    end
  rescue StandardError => e
    redirect_to user_book.book, warning: e.message
  end

  def destroy
    user_book = UserBook.find(params[:id])

    user_book.destroy!
    redirect_to user_book.book, success: '書籍を返却しました'
  end

  def user_book_params
    params.require(:user_book).permit(:id, :book_id)
  end
end
