require 'rails_helper'

RSpec.describe UserBook, type: :model do
  describe "scope" do
    describe "borrowed" do
      let!(:wow) { create(:user_book, book_id: 1)}
      subject {UserBook.borrowed }
      it { is_expected.to include wow}
    end
  end
end
