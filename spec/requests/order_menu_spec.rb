require 'rails_helper'

RSpec.describe "OrderMenus", type: :request do
  describe "GET /inde" do
    it "returns http success" do
      get "/order_menu/inde"
      expect(response).to have_http_status(:success)
    end
  end

end
