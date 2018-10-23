class UserBooksController < ApplicationController
  before_action :authenticate_user!

  def create
    user_book = UserBook.new(user_book_params.merge(user_id: current_user.id))
    return redirect_to root_path, warning: 'エラーが発生しました' unless user_book.book.present?

    if user_book.borrow
      redirect_to user_book.book, success: '書籍を借りました'
    else
      redirect_to user_book.book, warning: 'エラーが発生しました'
    end
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
