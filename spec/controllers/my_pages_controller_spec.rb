require 'rails_helper'

RSpec.describe MyPagesController, type: :controller do
  let(:user) do
    FactoryBot.create(:user)
  end
  describe 'GET #index' do
    before do
      sign_in user
    end
    it 'レスポンスステータス200を返すこと' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
