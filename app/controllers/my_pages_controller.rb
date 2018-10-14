class MyPagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = User.find(current_user.id).books.paginate(page: params[:page], per_page: 5)
  end
end
