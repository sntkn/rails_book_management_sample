class MyPagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = current_user.books.paginate(page: params[:page], per_page: 5)
  end
end
